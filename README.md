# babyviewr

Package for downloading BabyView data from Airtable. For internal usage at present. You will need two PATs -- one for Github and one for Airtable.

To install packages, first install the remotes package if you don't have it, via the following command:

```{r}
install.packages("remotes")
```

If you do not have your personal access token configured within github, you need to set this manually (it may be configured in your keychain or otherwise). Run the following command, and then copy your PAT from Github (you need to set this under "developer settings").

```{r}
credentials::set_github_pat()
```

Then, you can install the package in your r environment.
```{r}
remotes::install_github("babyviewr")
```

This package depends on `rairtable` and so you will likely need to set up an airtable Personal Access Token (PAT) via the following instructions (copied from the `rairtable` README):

First, install the airtable r package
```{r}
install.packages('rairtable')
```

1. Generate an Airtable API key from your Airtable account page.
2. pass the result to `rairtable::set_airtable_api_key('MY_KEY_HERE')`.
3. Store the key in your .Renviron file for use in the future using `set_airtable_api_key('MY_KEY_HERE', install = TRUE)`.
