context({
  testcase("Feedback bij spreidingsdiagram werkloosheid en criminaliteit", {
    test({
      # Check if submission is empty
      if (length(.__code__) == 0) {
        fail("Je hebt geen code ingediend. Schrijf code om een spreidingsdiagram te maken.")
      }
      
      # Convert code to string for analysis
      user_code <- paste(sapply(.__code__, function(e) paste(deparse(e), collapse = " ")), collapse = "\n")
      
      # Check if plot function is used
      if (!grepl("plot\\s*\\(", user_code)) {
        fail("We kunnen geen aanroep van de plot() functie vinden in je code. Gebruik plot() om een spreidingsdiagram te maken.")
      }
      
      # Check if both variables are used
      if (!grepl("werkloosheid", user_code) || !grepl("criminaliteitscijfers", user_code)) {
        fail("Je gebruikt niet beide variabelen 'werkloosheid' en 'criminaliteitscijfers' in je code.")
      }
      
      # Check if the variables are in the correct order if named parameters are used
      if (grepl("y\\s*=\\s*werkloosheid", user_code) || grepl("x\\s*=\\s*criminaliteitscijfers", user_code)) {
        fail("Je hebt de variabelen omgewisseld. 'werkloosheid' moet op de x-as staan en 'criminaliteitscijfers' op de y-as.")
      }
      
      # If code passes all checks, it's correct
      if (grepl("plot\\s*\\(\\s*werkloosheid\\s*,\\s*criminaliteitscijfers", user_code)) {
        success("Je hebt een correct spreidingsdiagram gemaakt!")
        return()
      }
      
      # More general pattern check
      if (grepl("plot\\s*\\(.*werkloosheid.*,.*criminaliteitscijfers.*\\)", user_code) || 
          grepl("plot\\s*\\(.*x\\s*=\\s*werkloosheid.*,.*y\\s*=\\s*criminaliteitscijfers.*\\)", user_code)) {
        success("Je hebt een correct spreidingsdiagram gemaakt!")
        return()
      }
      
      # If we get here, the code didn't match our expected patterns
      fail("Gebruik plot(werkloosheid, criminaliteitscijfers) om een spreidingsdiagram te maken.")
    })
  })
}, preExec = {
  werkloosheid <- c(4.2, 5.7, 7.9, 6.5, 8.1, 5.3, 9.2, 7.1, 6.8, 5.9, 8.5, 7.4, 6.2, 9.0, 5.1)
  criminaliteitscijfers <- c(25.3, 28.6, 33.1, 29.7, 35.4, 26.8, 38.2, 31.5, 30.9, 29.3, 36.1, 32.7, 29.0, 37.8, 27.2)
})
