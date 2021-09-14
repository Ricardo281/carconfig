#' Get the content from all webelements in a list
#'
#' This function allows you to extract all text / urls  from a list of webelments.
#' @param webels A list with webelements
#' @param contenttype A character string to choose the content to extract: Defaults to "text", "url" would be the other option
#' @return A vector containing the text/urls of all webelements
#' @export
#' @examples
#' url <- "https://www.hyundai.ch/"
#' remDr <-  prepare_browser_function(url,"id","onetrust-reject-all-handler", containerport = 4445L)
#' webelements <- remDr$findElements(using = "class", "menu")
#' result <-  get_content_webels(webelements, )

get_content_webels <- function(webels, contenttype = "text"){
  if(contenttype == "text"){
    content_webels_vec <- unlist(sapply(webels, function(x) x$getElementText()))
  } else if (contenttype == "url") {
    content_webels_vec <- unlist(sapply(webels, function(x) x$getElementAttribute("href")))
  }
  return(content_webels_vec)
}
