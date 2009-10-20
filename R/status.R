updateStatus <- function(text, session=getCurlHandle()) {
    out <- postForm("http://twitter.com/statuses/update.json",
                    status=text, curl=session)
    ## out is in byte code, need to pass that through a raw conversion
    ## to get the string.  Not sure why sometimes it's byte arrays and
    ## sometimes it is strings
    buildStatus(twFromJSON(rawToChar(out)))
}

tweet <- function(text, session=getCurlHandle()) {
    ## Just a wrapper around updateStatus
    updateStatus(text, session)
}

showStatus <- function(id, session=getCurlHandle()) {
    ## Doesn't require authentication via initSession unless the owner
    ## of the status is protected
    url <- paste("http://twitter.com/statuses/show/",
                        URLencode(id), ".json", sep="")
    out <- getURL(url)
    ret <- twFromJSON(out)
    buildStatus(ret)
}

deleteStatus <- function(status, session=getCurlHandle()) {
    url <- paste("http://twitter.com/statuses/destroy/",
                 status@id, ".json", sep="")
    ## I don't know how to simply POST or send a DELETE via RCurl w/o
    ## postForm, but this isn't a form so it throws a warning.
    ## Suppress these warnings
    curOpt <- options("warn")
    options(warn=-1)
    on.exit(options(warn=curOpt$warn), add=TRUE)
    out <- postForm(url, curl=session)
    options(warn=curOpt$warn)
    TRUE
}
