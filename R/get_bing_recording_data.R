#' get_bing_recording_data
#'
#' Gets all the data in bv-bing, which is the Bing headcam study.
#'
#' @param include_luna Set to `TRUE` to include Luna data.
#' @return Data frame of bv-main recordings.
#' @export

get_bing_recording_data <- function()
{
  print("downloading bv-bing recording data from airtable - this could take a little while!")

  table <- rairtable::airtable(table = 'tblkRXMPT0hTIYZcu', base = 'appQ7P6moc6knzYzN', view = "viwNVC4GQ0rnKXhjo")
  rairtable::read_airtable(table, id_to_col = TRUE) |>
    dplyr::as_tibble() |>
    dplyr::select(-airtable_record_id) |>
    dplyr::mutate(subject_id = unlist(subject_id))
}
