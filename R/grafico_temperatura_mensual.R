#' Función de Gráfico de la Temperatura Mensual
#'
#' La función se encarga de generar un gráfico de lineas para, a través de sus parámetros,
#' mostrar la temperatura promedio mensual de cada estación. Desde los datos, caclula el promedio
#' de temperatura mensual, y genera un gráfico comparando cada resultado.
#' @param df, data frame con información de estaciones
#' @param colores, string o vector de colores
#' @param titulo string
#'
#' @returns Gráfico de ggplot con la temperatura mensual de cada estación
#' @export
#'
#' @examples
#' estaciones <- data.frame(
#'   id = c("NH0910", "NH0910"),
#'   fecha = as.Date(c("2020-01-01", "2020-02-01")),
#'   temperatura_abrigo_150cm = c(10, 12)
#' )
#' grafico_temperatura_mensual(estaciones, colores = c("red"), titulo = "Ejemplo"

grafico_temperatura_mensual <- function(df, colores = NULL, titulo = "Temperatura") {

  # promedio mensual (asumimos fecha es Date/POSIXct y columnas existen)
  df_mes <- df |>
    dplyr::mutate(mes = lubridate::month(fecha, label = TRUE, abbr = TRUE)) |>
    dplyr::group_by(id, mes) |>
    dplyr::summarise(promedio = mean(temperatura_abrigo_150cm, na.rm = TRUE),
                     .groups = "drop")

  # paleta
  estaciones <- sort(unique(df_mes$id))
  n_ids <- length(estaciones)

  if (is.null(colores)) {
    colores <- sample(colors(), n_ids)
  } else if (length(colores) < n_ids) {
    colores <- c(colores, sample(setdiff(colors(), colores), n_ids - length(colores)))
  }
  # si vienen con nombres, respetar; si no, mapear en orden
  pal <- if (!is.null(names(colores)) && all(estaciones %in% names(colores))) {
    colores[estaciones]
  } else {
    stats::setNames(colores[seq_len(n_ids)], estaciones)
  }

  # gráfico
  ggplot2::ggplot(df_mes, ggplot2::aes(x = mes, y = promedio, color = id, group = id)) +
    ggplot2::geom_line(linewidth = 1) +
    ggplot2::geom_point(size = 1.8) +
    ggplot2::scale_color_manual(values = pal, name = "Estación") +
    ggplot2::labs(
      title = titulo,
      x = "Mes",
      y = "Temperatura promedio (°C)"
    ) +
    ggplot2::theme_minimal(base_size = 12) +
    ggplot2::theme(
      legend.position = "bottom",
      plot.title = ggplot2::element_text(face = "bold")
    )
}
