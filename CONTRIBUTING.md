# Contribuyendo a meteorologia

Esto describe cómo proponer un cambio en meteorologia.
Para una discusión detallada sobre cómo contribuir a este y otros paquetes del tidyverse, por favor consulta la guía de contribución al desarrollo
 y nuestros principios de revisión de código
.

## Corrección de errores tipográficos

Puedes corregir errores tipográficos, ortográficos o gramaticales en la documentación directamente usando la interfaz web de GitHub, siempre que los cambios se hagan en el archivo source.
Esto generalmente significa que necesitarás editar comentarios de roxygen2
 en un archivo .R, no en un archivo .Rd.
Puedes encontrar el archivo .R que genera el .Rd leyendo el comentario en la primera línea.

## Cambios más grandes

Si quieres hacer un cambio más grande, es buena idea primero abrir un issue y asegurarte de que alguien del equipo esté de acuerdo en que es necesario.
Si encontraste un error (bug), por favor abre un issue que ilustre el error con un reprex
 mínimo (esto también te ayudará a escribir un test unitario, si es necesario).
Consulta nuestra guía sobre cómo crear un excelente issue
 para más consejos.

### Proceso de pull request

Haz un fork del paquete y clónalo en tu computadora. Si no lo has hecho antes, recomendamos usar usethis::create_from_github("biancarossi/meteorologia", fork = TRUE).

Instala todas las dependencias de desarrollo con devtools::install_dev_deps(), y luego asegúrate de que el paquete pase R CMD check ejecutando devtools::check().
Si R CMD check no pasa sin errores, es buena idea pedir ayuda antes de continuar.

Crea una rama de Git para tu pull request (PR). Recomendamos usar usethis::pr_init("breve-descripción-del-cambio").

Realiza tus cambios, haz commit en Git, y luego crea un PR ejecutando usethis::pr_push() y siguiendo las instrucciones en tu navegador.
El título de tu PR debe describir brevemente el cambio.
El cuerpo de tu PR debe contener Fixes #número-del-issue.

Para cambios visibles para el usuario, agrega un punto en la parte superior de NEWS.md (justo debajo del primer encabezado). Sigue el estilo descrito en https://style.tidyverse.org/news.html
.

### Estilo de código

El nuevo código debe seguir la guía de estilo del tidyverse
.
Puedes usar Air
 para aplicar este estilo, pero por favor no restyles código que no tenga relación con tu PR.

Usamos roxygen2
, con sintaxis Markdown
, para la documentación.

Usamos testthat
 para tests unitarios.
Las contribuciones que incluyen casos de prueba son más fáciles de aceptar.

## Código de Conducta

Ten en cuenta que el proyecto meteorologia se lanza con un
Código de Conducta para Contribuyentes
. Al contribuir a este
proyecto, aceptas cumplir con sus términos.
