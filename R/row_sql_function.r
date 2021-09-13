#' Writes a dataframe to the database
#'
#' This function allows you to write the data of dataframe to the database.
#' @param df_raw A dataframe or a matrix
#' @param tablename A string which contains the name of table in the database
#' @export
#' @examples
#' df <-  data.frame(a= "audi s6 bezin", b="80000 CHF")
#' row_sql_function(df, "ConfigCars")

row_sql_function <- function(df_raw,tablename){
  df <- as.data.frame(df_raw)
  if (nrow(df) > 0) {
    df <- data.frame(lapply(df, gsub, pattern = "'",replacement= ""))
    for (i in 1:nrow(df)){
      sqlstring <- paste0("INSERT IGNORE INTO ",tablename ," VALUES('",paste0(as.character(df[i,]) ,collapse = "', '"), "')")
      con <- tryCatch({
        DBI::dbSendQuery(con,sqlstring)
        return(con)},
        error = function(cond){
          lapply(DBI::dbListConnections(RMySQL::MySQL()), DBI::dbDisconnect)
          con <- connectToDb_func()
          DBI::dbSendQuery(con,sqlstring)
          return(con)
        }
      )
    }
  }
  return(con)
}



