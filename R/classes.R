setClass("status",
         representation(
                        text="character",
                        favorited="logical",
                        replyToSN="character",
                        created="character",
                        truncated="logical",
                        replyToSID="numeric",
                        id="numeric",
                        replyToUID="numeric",
                        statusSource="character"
                        )
         )

setMethod("text", signature="status", function(x, ...) {
    x@text
})

setMethod("show", signature="status", function(object) {
    print(text(object))
})



setClass("user",
         representation(
                        description="character",
                        statusesCount="numeric",
                        followersCount="numeric",
                        favoritesCount="numeric",
                        friendsCount="numeric",
                        url="character",
                        name="character",
                        created="character",
                        protected="logical",
                        verified="logical",
                        screenName="character",
                        location="character",
                        id="numeric",
                        lastStatus="status"
                        )
         )
setGeneric("screenName", function(object, ...)
           standardGeneric("screenName"))

setMethod("screenName", signature="user", function(object, ...) {
    object@screenName
})

setMethod("show", signature="user", function(object) {
    print(screenName(object))
})

setClass("directMessage",
         representation(
                        text="character",
                        recipientSN="character",
                        created="character",
                        recipientID="numeric",
                        sender="user",
                        recipient="user",
                        senderID="numeric",
                        id="numeric",
                        senderSN="character"
                        )
         )

setMethod("show", signature="directMessage", function(object) {
    print(paste(screenName(object@sender), "->",
                screenName(object@recipient),  ":",
                object@text, sep=""))
})
