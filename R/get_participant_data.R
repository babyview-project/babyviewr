#' get_participant_data
#'
#' Gets all the data in the participant table, optionally merging demographics.
#'
#' @param include_demogrpahics Set to `TRUE` to merge demographic information.
#' @return Data frame of participants.
#' @export
get_participant_data <- function(include_demographics=TRUE)
{
  if (include_demographics) {
    demographics_table <- rairtable::airtable(table = 'tblIFyS2Ycx4Wgp1P', base = 'appQ7P6moc6knzYzN')
    demographics <- rairtable::read_airtable(demographics_table, id_to_col = TRUE) |>
      dplyr::as_tibble() |>
      dplyr::select(-airtable_record_id) |>
      dplyr::mutate(airtable_record_id = unlist(subject_id)) |>
      dplyr::select(-subject_id, -demographics_primary_key)
  }

  participants_table <- rairtable::airtable(table = 'tbl5YIcTCibyia5gJ', base = 'appQ7P6moc6knzYzN')
  participants <- rairtable::read_airtable(participants_table, id_to_col = TRUE) |>
    dplyr::as_tibble() |>
    dplyr::select(-Recordings, -`Blackout & Muted Videos`, -`BV-Main Demographics`) |>
    dplyr::mutate(dataset = lapply(dataset, \(x) ifelse(is.null(x), NA, x))) |>
    dplyr::mutate(dataset = unlist(dataset),
                  date_birth_rounded = lubridate::ymd(date_birth_rounded),
                  date_started_recording = lubridate::ymd(date_started_recording))

  if (include_demographics) {
    participants <- participants |>
      dplyr::left_join(demographics, by = "airtable_record_id")
  }

  participants <- select(-airtable_record_id)

  return(participants)
}
