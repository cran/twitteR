\name{getUser}
\alias{getUser}
\alias{userFriends}
\alias{userFollowers}
\title{ Functions to manage Twitter users }
\description{
  These functions allow you interact with information about a Twitter
  user - retrieving their base information, list of friends, list of
  followers, and an up to date timeline.
}
\usage{
getUser(user, session = getCurlHandle())
userFriends(user, session = getCurlHandle())
userFollowers(user, session = getCurlHandle())
}
\arguments{
  \item{user}{ The Twitter user to detail, can be \code{character} or
    an \code{\link{user}} object.}
  \item{session}{ A session object from \code{\link{initSession}} }
}
\details{
  These functions will only return fully formed objects if the
  authenticated user is allowed to see the requested user.  If that
  person has a private account and has not allowed you to see them, you
  will not be able to extract that information.
}
\value{
  The \code{getUser} function returns an object of class
  \code{\link{user}}.

  The functions \code{userFriends} and \code{userFollowers} return lists
  of class \code{\link{user}} objects.
}
\author{Jeff Gentry}
\seealso{ \code{\link{initSession}}, \code{\link{mentions}}}
\examples{
   \dontrun{
      sess <- initSession('myuser', 'mypass')
      tuser <- getUser('twitter', sess)
      tfriends <- userFriends(tuser, sess)
      tfollowers <- userFollowers(tuser, sess)
      ttimeline <- userTimeline(tuser, sess)
   }
}
\keyword{ interface }
