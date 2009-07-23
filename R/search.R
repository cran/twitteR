Rtweets <- function(session=getCurlHandle()) {
    out <- getURL('http://search.twitter.com/search.json?q=%23rstats',
                  curl=session )
    jsonList <- twFromJSON(out)[[1]]
    sapply(jsonList, buildStatus)
}
