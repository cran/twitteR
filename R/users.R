getUser <- function(user, session=getCurlHandle(), ...) {
    if (inherits(user, "user"))
        user <- screenName(user)

    ## For god knows what reason, my normal methods don't work here,
    ## build URL by hand
    url <- paste("http://api.twitter.com/1/users/show/",
                 URLencode(user), '.json', sep="")
    out <- getURL(url, curl=session, ...)
    ## Need some error checking
    buildUser(twFromJSON(out))
}

userFriends <- function(user, n=100, session=getCurlHandle(), ...) {
    statusesBase(user, 'friends', n, session, ...)
}

userFollowers <- function(user, n=100, session=getCurlHandle(), ...) {
    statusesBase(user, 'followers', n, session, ...)
}

statusesBase <- function(user, type, n=100,
                         session=getCurlHandle(), ...) {
    if (inherits(user, 'user'))
        user <- screenName(user)
    n <- as.integer(n)
    baseUrl <- paste('http://api.twitter.com/1/statuses/',
                     type, '/', URLencode(user), '.json?cursor=', sep='')
    pages <- ceiling(n/100)
    jsonList <- list()
    cursor = -1
    for (i in seq(to=pages)) {
        ## Probably shouldn't be catting multiple lists together,
        ## although this does need to be done sequentially as each
        ## call gets the cursor for the next call
        url <- paste(baseUrl, cursor, sep='')
        out <- getURL(url, curl=session, ...)
        json <- twFromJSON(out)
        jsonList <- c(jsonList, json$users)
        cursor <- json[['next_cursor']]
    }
    sapply(jsonList, buildUser)
}

