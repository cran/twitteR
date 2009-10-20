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
                        statusSource="character",
                        screenName="character"
                        )
         )

setMethod("text", signature="status", function(x, ...) {
    x@text
})

setMethod("show", signature="status", function(object) {
    print(paste(screenName(object), text(object), sep=": "))
})

setMethod("favorited", signature="status", function(object, ...) {
    object@favorited
})

setMethod("replyToSN", signature="status", function(object, ...) {
    object@replyToSN
})

setMethod("created", signature="status", function(object, ...) {
    object@created
})

setMethod("truncated", signature="status", function(object, ...) {
    object@truncated
})

setMethod("replyToSID", signature="status", function(object, ...) {
    object@replyToSID
})

setMethod("id", signature="status", function(object, ...){
    object@id
})

setMethod("replyToUID", signature="status", function(object, ...) {
    object@replyToUID
})

setMethod("statusSource", signature="status", function(object, ...) {
    object@statusSource
})

setMethod("screenName", signature="status", function(object, ...) {
    object@screenName
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

setMethod("screenName", signature="user", function(object, ...) {
    object@screenName
})

setMethod("show", signature="user", function(object) {
    print(screenName(object))
})

setMethod("description", signature="user", function(object, ...) {
    object@description
})

setMethod("statusesCount", signature="user", function(object, ...) {
    object@statusesCount
})

setMethod("tweetCount", signature="user", function(object, ...) {
    statusesCount(object)
})

setMethod("followersCount", signature="user", function(object, ...) {
    object@followersCount
})

setMethod("favoritesCount", signature="user", function(object, ...) {
    object@favoritesCount
})

setMethod("friendsCount", signature="user", function(object, ...) {
    object@friendsCount
})

setMethod("userURL", signature="user", function(object, ...) {
    object@url
})

setMethod("name", signature="user", function(object, ...) {
    object@name
})

setMethod("created", signature="user", function(object, ...) {
    object@created
})

setMethod("protected", signature="user", function(object, ...) {
    object@protected
})

setMethod("verified", signature="user", function(object, ...) {
    object@verified
})

setMethod("location", signature="user", function(object, ...) {
    object@location
})

setMethod("id", signature="user", function(object, ...) {
    object@id
})

setMethod("lastStatus", signature="user", function(object, ...) {
    object@lastStatus
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

setMethod("text", signature="directMessage", function(x) {
    x@text
})

setMethod("recipientSN", signature="directMessage", function(object) {
    object@recipientSN
})

setMethod("created", signature="directMessage", function(object) {
    object@created
})

setMethod("recipientID", signature="directMessage", function(object) {
    object@recipientID
})

setMethod("sender", signature="directMessage", function(object) {
    object@sender
})

setMethod("recipient", signature="directMessage", function(object) {
    object@recipient
})

setMethod("senderID", signature="directMessage", function(object) {
    object@senderID
})

setMethod("id", signature="directMessage", function(object) {
    object@id
})

setMethod("senderSN", signature="directMessage", function(object) {
    object@senderSN
})
