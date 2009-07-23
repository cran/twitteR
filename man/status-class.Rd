\name{status-class}
\Rdversion{1.1}
\docType{class}
\alias{status-class}
\alias{status}
\alias{buildStatus}
\alias{show,status-method}
\alias{text,status-method}
\title{Class to contain a Twitter status}
\description{Container for Twitter status messages, including the text
  as well as basic information}
\section{Objects from the Class}{
  \code{new('status',
    text = [character],
    favorited = [logical],
    replyToSN = [character],
    created = [character],
    truncated = [logical],
    replyToSID = [numeric],
    id = [numeric],
    replyToUID = [numeric],
    statusSource = [character],
    ...)}

  These objects are typically constructed as a side effect from various
  functions, such as \code{\link{updateStatus}}.
}
\section{Slots}{
	 \describe{
    \item{\code{text}:}{Text of the status }
    \item{\code{favorited}:}{Whether the status is favorited }
    \item{\code{replyToSN}:}{Screen name that this is in reply to }
    \item{\code{created}:}{When this status was created }
    \item{\code{truncated}:}{Whether this status was truncated }
    \item{\code{replyToSID}:}{Reply to which status ID }
    \item{\code{id}:}{ID of the object }
    \item{\code{replyToUID}:}{Reply to which user ID }
    \item{\code{statusSource}:}{Source of the status message }
  }
}
\section{Methods}{
  \describe{
    \item{show}{Displays information about the status}
    \item{text}{Returns the text of the status}
	 }
}
\author{Jeff Gentry}
\seealso{
  \code{\link{updateStatus}}, \code{\link{publicTimeline}},
  \code{\link{friendsTimeline}}, \code{\link{userTimeline}}
}
\keyword{classes}
