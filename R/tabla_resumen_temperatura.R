#' Funcion de Tabla Resumen Datos Meteorologicos
#'
#' Esta funcion toma un conjunto de datos con datos de una o mas estaciones,
#' y devuelve una tabla con datos sobre la temperatura abrigo 150 cm de esa/as estacion/es
#' (el promedio, desvio estandar, temperatura maxima, y temperatura minima)
#' @param estacion conjunto de datos (csv) del INTA.
#'
#' @returns tabla resumen
#' @export
#'
#' @examples
#' df <- data.frame(
#'   id = c("NH0910", "NH0910"),
#'   temperatura_abrigo_150cm = c(10, 12),
#'   temperatura_abrigo_150cm_maxima = c(15, 14),
#'   temperatura_abrigo_150cm_minima = c(8, 9)
#' )
#' tabla_resumen_temperatura(df)
tabla_resumen_temperatura <- function(estacion) {
  if (!is.data.frame(estacion)) {
    stop("El argumento estacion debe ser un data.frame o tibble con los datos de las estaciones.")
  }

  # Resumen
  resumen <- estacion |>
    dplyr::group_by(id) |>
    dplyr::summarise(
      promedio_temperatura = mean(temperatura_abrigo_150cm, na.rm = TRUE),
      desvio_estandar = stats::sd(temperatura_abrigo_150cm, na.rm = TRUE),
      temp_max = max(temperatura_abrigo_150cm_maxima, na.rm = TRUE),
      temp_min = min(temperatura_abrigo_150cm_minima, na.rm = TRUE)
    )

  return(resumen)
}


