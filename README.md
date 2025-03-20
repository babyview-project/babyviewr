# babyviewr

Package for downloading BabyView data from airtable. For internal usage at present. 

To install package, use the following command:

```{r}
remotes::install_github("babyviewr")
```

Depends on `rairtable` and so you will likely need to set up an airtable Personal Access Token (PAT) via the following instructions (copied from the `rairtable` README):

1. Generate an Airtable API key from your Airtable account page.
2. pass the result to `set_airtable_api_key('MY_KEY_HERE')`.
3. Store the key in your .Renviron file for use in the future using `set_airtable_api_key('MY_KEY_HERE', install = TRUE)`.
