#' Seperate Price from/in a string
#'
#' This function allows you open the browser with a specific url and sets the
#' @param string_vector A string which contains a price with currency CHF
#' @param price A logical value to indicate if the price or the rest should be the result. Defaults to TRUE
#' @return A string which containts the result
#' @export
#' @examples
#' result <- seperate_price_from_string("Navigation CHF 1000")

seperate_price_from_string <- function(string_vector, price=TRUE){
  if (price == TRUE){
    extracted_string <-trimws(stringr::str_extract(string_vector,"(CHF|[^0-9])[[:space:]]([0-9]{0,1}'?[0-9]+\\.?[0-9]+|[0-9])( CHF|$)"))
  } else {
    extracted_string <- gsub("(CHF|[^0-9])[[:space:]]([0-9]{0,1}'?[0-9]+\\.?[0-9]+|[0-9])( CHF|$)","",string_vector)

  }
  return(extracted_string)
}
