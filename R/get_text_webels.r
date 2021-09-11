#' Get the text from all webelements in a list 
#'
#' This function allows you to extract all text elements from a list of webelments.
#' @param webels A list with webelements
#' @return A vector containing the text of all webelements
#' @export
#' @examples
#' url <- "https://www.hyundai.ch/"
#' remDr <-  prepare_browser_function(url,"id","onetrust-reject-all-handler", containerport = 4445L)
#' webelements <- remDr$findElements(using = "class", "menu")
#' result <-  get_text_webels(webelements)

get_text_webels <- function(webels){
  text_webels_vec <- unlist(sapply(webels, function(x) x$getElementText()))
  return(text_webels_vec)
}