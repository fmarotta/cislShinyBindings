#' circularSliderInput
#'
#' @export
circularSliderInput <- function(inputId, label, min, max, value,
                                step = NULL, breaks_n = 100, major_breaks_every = 10,
                                ruler_inside = TRUE, breaks_altitude = 23,
                                labels_altitude = 11, digits = 2, prefix = NULL,
                                postfix = NULL, values_sep = ":") {
    addResourcePath(
        prefix = "vendorCircularSlider",
        directoryPath = system.file("vendor/circularSlider", package = "cislShinyBindings")
    )
    addResourcePath(
        prefix = "wwwCircularSlider",
        directoryPath = system.file("www", package = "cislShinyBindings")
    )
    if (ruler_inside)
        ruler_inside <- "true"
    else
        ruler_inside <- "false"
    tagList(
        singleton(tags$head(
            tags$script(src = "vendorCircularSlider/js/circularSlider.js"),
            tags$script(src = "wwwCircularSlider/cislShinyBindings.js"),
            tags$link(rel = "stylesheet", type = "text/css", href = "vendorCircularSlider/css/circularSlider.css"),
            tags$link(rel = "stylesheet", type = "text/css", href = "wwwCircularSlider/cislShinyBindings.css")
        )),
        div(class = "form-group shiny-input-container",
            shiny:::shinyInputLabel(inputId, label),
            tags$input(type = "text", id = inputId, class = "CircularSlider",
                "data-min" = min,
                "data-max" = max,
                "data-from" = value[1],
                "data-to" = value[2],
                "data-step" = step,
                "data-breaks-n" = breaks_n,
                "data-major-breaks-every" = major_breaks_every,
                "data-ruler-inside" = ruler_inside,
                "data-breaks-altitude" = breaks_altitude,
                "data-labels-altitude" = labels_altitude,
                "data-digits" = digits,
                "data-prefix" = prefix,
                "data-postfix" = postfix,
                "data-values-sep" = values_sep
            )
        )
    )
}
