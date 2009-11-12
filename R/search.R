Rtweets <- function(session=getCurlHandle(), num=25) {
    searchTwitter("#rstats", session, num)
}

searchTwitter <- function(searchString, session=getCurlHandle(),
                          num=25) {
    ## A basic search function.  Only implements a search on a string
    ## and will return num results

    qrySearch <- URLencode(searchString)
    if (nchar(qrySearch) > 140)
        stop("searchString is limited to 140 characters")
    url <- paste("http://search.twitter.com/search.json?q=",
                 qrySearch, "&rpp=", num, sep="")
    out <- getURL(url)
    jsonList <- twFromJSON(out)[[1]]
    sapply(jsonList, buildStatus)
}
