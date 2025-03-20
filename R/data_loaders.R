
# get_main_recording_data
# gets all the data in bv-main, which is the home headcam study
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
    dplyr::as_tibble()
}

# get_bing_recording_data
# gets all the data in bv-main, which is the home headcam study
get_bing_recording_data <- function()
{
  print("downloading bv-bing recording data from airtable - this could take a little while!")

  table <- rairtable::airtable(table = 'tblkRXMPT0hTIYZcu', base = 'appQ7P6moc6knzYzN', view = "viwNVC4GQ0rnKXhjo")
  rairtable::read_airtable(table, id_to_col = TRUE) |>
    dplyr::as_tibble()
}


# get_participant_data
# gets demographics and participant info
get_participant_data <- function(include_demographics=TRUE)
{
  if (include_demographics) {
    demographics_table <- rairtable::airtable(table = 'tblIFyS2Ycx4Wgp1P', base = 'appQ7P6moc6knzYzN')
    demographics <- rairtable::read_airtable(demographics_table, id_to_col = TRUE) |>
      dplyr::as_tibble() |>
      dplyr::select(-airtable_record_id) |>
      dplyr::mutate(airtable_record_id = unlist(subject_id)) |>
      dplyr::select(-subject_id)
  }

  participants_table <- rairtable::airtable(table = 'tbl5YIcTCibyia5gJ', base = 'appQ7P6moc6knzYzN')
  participants <- rairtable::read_airtable(participants_table, id_to_col = TRUE) |>
    dplyr::as_tibble() |>
    dplyr::select(-Recordings, -`Blackout & Muted Videos`)
  # |>
  #   dplyr::mutate(dataset = unlist(dataset))

  if (include_demographics) {
    participants <- participants |>
      dplyr::left_join(demographics, by = "airtable_record_id")
  }

  return(participants)
}
