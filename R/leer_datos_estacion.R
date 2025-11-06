#' Función de lectura de los datos de las estaciones
#'
#' La función se encarga de leer los datos de los archivos de las estaciones, el usuario debe pasar los dos argumentos, siendo estos el id de la estación y la ruta para acceder a ellos, a su lectura y descarga.
#' @param id_estacion es un string del id
#' @param ruta_archivo string con la ruta del archivo, donde está guardado, o donde se quiera descargar.
#'
#' @returns conjunto de datos de la estación/es llamadas
#' @export
#'
#' @examples leer_datos_estacion("NHO472", "Downloads/Estaciones")
#'
leer_datos_estacion <- function(id_estacion, ruta_archivo) {

  # Estaciones disponibles
  enlaces <- list(
    "metadatos" = "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/metadatos_completos.csv",
    "NH0472" = "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0472.csv",
    "NH0910" = "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0910.csv",
    "NH0046" = "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0046.csv",
    "NH0098" = "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0098.csv",
    "NH0437" = "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0437.csv"
  )

  # Verificar ID válido
  if (!id_estacion %in% names(enlaces)) {
    cli::cli_abort("El ID de estación '{id_estacion}' no es válido. Usa alguno de los siguientes: metadatos, NH0472, NH0910, NH0046, NH0098, NH0437")
  }

  link_archivo <- enlaces[[id_estacion]]

  # Leer o descargar según corresponda
  if (file.exists(ruta_archivo)) {
    cli::cli_inform("El archivo ya está descargado, se procede a leerlo...")
  } else {
    cli::cli_inform("El archivo no está descargado, se procede a descargarlo...")
    dir.create(dirname(ruta_archivo), showWarnings = FALSE, recursive = TRUE)
    utils::download.file(link_archivo, destfile = ruta_archivo)
  }

  # Leer el archivo con readr
  datos_estacion <- readr::read_csv(ruta_archivo, show_col_types = FALSE)

  cli::cli_inform("Lectura completada correctamente para la estación {id_estacion}.")

  return(datos_estacion)
}

