imguRupload <- function(filename, title=NULL, caption=NULL, name=basename(filename), apikey="4feb29d00face5bc1b9dae536e15c373") {
    require(RCurl)
    require(httr)
    require(XML)
    if (length(filename)!=1) stop("'filename' must be length 1.")
    if (!file.exists(filename)) stop(filename, "does not exist!")
    params <- list(key=apikey, image=fileUpload(filename), name=filename)
    if (!is.null(title)) params[["title"]] <- title
    if (!is.null(caption)) params[["caption"]] <- caption
    unlist(xmlToList(rawToChar(content(POST("http://api.imgur.com/2/upload", body=params)))))
}
  
