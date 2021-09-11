#' Get all urls from list of webelements
#'
#' This function allows you to extract all href elements from a list of webelments.
#' @param webels A list with webelements
#' @return A vector containing the urls of all webelements
#' @export
#' @examples
#' url <- "https://www.hyundai.ch/"
#' remDr <-  prepare_browser_function(url,"id","onetrust-reject-all-handler", containerport = 4445L)
#' webelements <- remDr$findElements(using = "class", "menu")
#' result <-  get_href_webels(webelements)

get_href_webels <- function(webels){
  url_list <- unlist(sapply(webels, function(x) x$getElementAttribute("href")))
  return(url_list)
}

