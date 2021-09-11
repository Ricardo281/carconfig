#' Get only the visible elements from a list of webelements
#'
#' This function allows you to extract only the visible elements from a list of webelments.
#' @param webels A list with webelements
#' @return A vector containing only the visible webelements
#' @export
#' @examples
#' url <- "https://www.hyundai.ch/"
#' remDr <-  prepare_browser_function(url,"id","onetrust-reject-all-handler", containerport = 4445L)
#' remDr$navigate("https://www.hyundai.ch/de/model/i10/")
#' configbutton <- remDr$findElements(using = "id", "configBtn")
#' visbible_configbutton <- get_visible_webels(configbutton)
#' length(configbutton)
#' length(visbible_configbutton)

get_visible_webels <- function(list_of_webel){
  filteredlist <- Filter(function(x) x$isElementDisplayed(), list_of_webel)
  return(unlist(filteredlist))
}


