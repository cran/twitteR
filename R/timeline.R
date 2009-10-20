publicTimeline <- function(session=getCurlHandle()) {
    out <- getURL("http://twitter.com/statuses/public_timeline.json",
                  curl=session)
    jsonList <- twFromJSON(out)
    sapply(jsonList, buildStatus)
}

friendsTimeline <- function(session=getCurlHandle()) {
    ## FIXME: Does not currently support parameters
    out <- getURL("http://twitter.com/statuses/friends_timeline.json",
                  curl=session)
    jsonList <- twFromJSON(out)
    sapply(jsonList, buildStatus)
}

userTimeline <- function(user, session=getCurlHandle()) {
    if (inherits(user, "user"))
        user <- user@screenName

    ## FIXME: Does not support any parameters
    ## Only requires authentication if 'user' is protected
    if (inherits(user, "user"))
        user <- user@screenName

    url <- paste("http://twitter.com/statuses/user_timeline.json?screen_name=",
                 URLencode(user), sep="")
    out <- getURL(url, curl=session)
    jsonList <- twFromJSON(out)
    sapply(jsonList, buildStatus)
}

mentions <- function(session=getCurlHandle()) {
    ## FIXME: Does not support any parameters
    out <- getURL("http://twitter.com/statuses/mentions.json",
                  curl=session)
    jsonList <- twFromJSON(out)
    sapply(jsonList, buildStatus)
}

