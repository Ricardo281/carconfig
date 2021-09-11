#' A Connection to the Database
#'
#' This function allows you to connect to the MySql Database. 
#' @return connectToDb_func() returns an S4 object that inherits from DBIConnection. 
#'    This object is used to communicate with the database engine.
#' @export
#' @examples
#' libary(DBI)
#' con <- connectToDb_func()
#' sqlstring <- "SELECT * FROM ConfigCars"
#' df <- dbGetQuery(con, sqlstring)

connectToDb_func <- function(){
  con <- RMySQL::dbConnect(
    RMySQL::MySQL(),
    user = "u723490217_ricardo",
    password = "o.JphvmhZNACmm8gXJbiAKuLp2YCrU3z5P",
    dbname = "u723490217_Astra",
    host = "185.224.138.133"
  )
  return(con)
}


