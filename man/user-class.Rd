\name{user-class}
\Rdversion{1.1}
\docType{class}
\alias{user-class}
\alias{user}
\alias{buildUser}
\alias{screenName}
\alias{screenName,user-method}
\alias{show,user-method}

\title{A container object to model Twitter users }
\description{This class is designed to represent a user on Twitter,
  modeling information available}
\section{Objects from the Class}{
  \code{new('user',
    description = [character],
    statusesCount = [numeric],
    followersCount = [numeric],
    favoritesCount = [numeric],
    favoritesCount = [numeric],
    friendsCount = [numeric],
    url = [character],
    name = [character],
    created = [character],
    protected = [logical],
    verified = [logical],
    screenName = [character],
    location = [character],
    id = [numeric],
    lastStatus = [status], ...)}
}
\section{Slots}{
	 \describe{
    \item{\code{description}:}{Description of the user }
    \item{\code{statusesCount}:}{Number of status messages the user has }
    \item{\code{followersCount}:}{Number of followers the user has }
    \item{\code{favoritesCount}:}{Number of favorites the user has }
    \item{\code{friendsCount}:}{The number of friends the user has }
    \item{\code{url}:}{URL associated with the user }
    \item{\code{name}:}{The user's name }
    \item{\code{created}:}{When the user was created }
    \item{\code{protected}:}{Is the user protected? }
    \item{\code{verified}:}{Is the user verified? }
    \item{\code{screenName}:}{Screen name of the user }
    \item{\code{location}:}{Location of the user }
    \item{\code{id}:}{ID of the user }
    \item{\code{lastStatus}:}{A \code{"status"} object displaying the
      last status the user has posted }
  }
}
\section{Methods}{
  \describe{
    \item{screenName}{Returns the screen name of the user }
    \item{show}{Displays basic information about the user }
	 }
}
\author{Jeff Gentry}
\seealso{
}
\keyword{classes}
