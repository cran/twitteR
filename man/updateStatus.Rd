\name{updateStatus}
\Rdversion{1.1}
\alias{updateStatus}
\alias{deleteStatus}
\alias{showStatus}
\title{
  Functions to manipulate Twitter status
}
\description{
  These functions can be used to set or delete a user's Twitter status
}
\usage{
updateStatus(text, session = getCurlHandle())
deleteStatus(status, session = getCurlHandle())
}
\arguments{
  \item{text}{The text to use for a new status }
  \item{status}{An object of class \code{\link{status}}}
  \item{session}{An object from \code{\link{initSession}}}
}
\details{
  To delete a status message, pass in an object of class
  \code{\link{status}}, such as from the return value of \code{updateStatus}.
}
\value{
  The \code{updateStatus} function will return an object of class
  \code{\link{status}}.

  The \code{deleteStatus} returns \code{TRUE} on success and an error if
  failure occurs.
}
\author{
   Jeff Gentry
}
\seealso{
  \code{\link{initSession}}
}
\examples{
   \dontrun{
      sess <- initSession('myUser', 'myPass')
      ns <- updateStatus('this is my new status message', sess)
      ## ooops, we want to remove it!
      deleteStatus(ns)
   }
}
\keyword{ interface }
