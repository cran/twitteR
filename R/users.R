getUser <- function(user, session=getCurlHandle(), ...) {
    if (inherits(user, "user"))
        user <- screenName(user)

    ## For god knows what reason, my normal methods don't work here,
    ## build URL by hand
    url <- paste("http://twitter.com/users/show.json?screen_name=",
                 URLencode(user), sep="")
    out <- getURL(url, curl=session, ...)
    ## Need some error checking
    buildUser(twFromJSON(out))
}

userFriends <- function(user, session=getCurlHandle(), ...) {
    if (inherits(user, "user"))
        user <- screenName(user)
    ## For god knows what reason, my normal methods don't work here,
    ## build URL by hand
    url <- paste("http://twitter.com/statuses/friends.json?screen_name=",
                 URLencode(user), sep="")
    out <- getURL(url, curl=session, ...)
    ## Need some error checking
    jsonList <- twFromJSON(out)
    sapply(jsonList, buildUser)
}

userFollowers <- function(user, session=getCurlHandle(), ...) {
    if (inherits(user, "user"))
        user <- screenName(user)
    ## For god knows what reason, my normal methods don't work here,
    ## build URL by hand
    url <- paste("http://twitter.com/statuses/followers.json?screen_name=",
                 URLencode(user), sep="")
    out <- getURL(url, curl=session, ...)
    ## Need some error checking
    jsonList <- twFromJSON(out)
    sapply(jsonList, buildUser)
}
