dmGet <- function(session=getCurlHandle()) {
    ## No parameters for now
    out <- getURL("http://twitter.com/direct_messages.json",
                  curl=session)
    jsonList <- twFromJSON(out)
    sapply(jsonList, buildDM)
}

dmSent <- function(session=getCurlHandle()) {
    ## No parameters for now
    out <- getURL("http://twitter.com/direct_messages/sent.json",
                  curl=session)
    jsonList <- twFromJSON(out)
    sapply(jsonList, buildDM)
}

dmDestroy <- function(dm, session=getCurlHandle()) {
    url <- paste("http://twitter.com/direct_messages/destroy/",
                 dm@id, ".json", sep="")
    ## I don't know how to simply POST or send a DELETE via RCurl w/o
    ## postForm, but this isn't a form so it throws a warning.
    ## Suppress these warnings
    out <- suppressWarnings(postForm(url, curl=session))
    TRUE
}

dmSend <- function(text, user, session=getCurlHandle()) {
    if (inherits(user, "user"))
        user <- user@id
    ## I don't know how to simply POST or send a DELETE via RCurl w/o
    ## postForm, but this isn't a form so it throws a warning.
    ## Suppress these warnings
    out <- suppressWarnings(postForm("http://twitter.com/direct_messages/new.json",
                                     text=text, user=user, curl=session))
    buildDM(twFromJSON(rawToChar(out)))
}
