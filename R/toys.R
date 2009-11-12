taskStatus <- function(expr, to, msg="",
                       session=getCurlHandle()) {
    ##
    status <- try(expr, silent=TRUE)
    if (inherits(status, "try-error")) {
        out <- paste(paste("Your task failed with error message",
                           status), msg, ":")
        dmSend(out, to, session)
    }
    else {
        out <- paste("Your task has completed successfully",
                     msg, sep=":")
        dmSend(out, to, session)
    }
    status
}

