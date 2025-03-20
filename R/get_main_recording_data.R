#' get_main_recording_data
#'
#' Gets all the data in bv-main, which is the home headcam study
#'
#' @param include_luna Set to `TRUE` to include Luna data.
#' @return Data frame of bv-main recordings.
#' @export
get_main_recording_data <- function(include_luna = FALSE)
{
  print("downloading bv-main recording data from airtable - this could take a little while!")

  if (include_luna) {
    view = "viwFKXZZONENZOjRU"
  } else {
    view = "viw7ALpGyC06NeXsV"
  }

  table <- rairtable::airtable(table = 'tblkRXMPT0hTIYZcu', base = 'appQ7P6moc6knzYzN', view = view)
  rairtable::read_airtable(table, id_to_col = TRUE) |>
    dplyr::as_tibble() |>
    dplyr::select(-airtable_record_id) |>
    dplyr::mutate(subject_id = unlist(subject_id))
}
