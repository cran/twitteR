initSession <- function(username, password) {
    getCurlHandle(userpwd=paste(username, password, sep=":"),
                  .opts=curlOptions(httpHeader=c(Expect="")))
}
