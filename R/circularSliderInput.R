#' circularSliderInput
#'
#' @export
circularSliderInput <- function(inputId, label, value) {
    addResourcePath(
        prefix = "vendorCircularSlider",
        directoryPath = system.file("vendor/circularSlider", package = "cislShinyBindings")
    )
    addResourcePath(
        prefix = "wwwCircularSlider",
        directoryPath = system.file("www", package = "cislShinyBindings")
    )
    tagList(
        singleton(tags$head(
            tags$script(src = "vendorCircularSlider/js/circularSlider.js"),
            tags$script(src = "wwwCircularSlider/cislShinyBindings.js"),
            tags$link(rel = "stylesheet", type = "text/css", href = "vendorCircularSlider/css/circularSlider.css"),
            tags$link(rel = "stylesheet", type = "text/css", href = "wwwCircularSlider/cislShinyBindings.css")
        )),
        tags$input(type = "text", id = inputId, class = "CircularSlider",
            "data-height" = 600,
            "data-ruler-inside" = F
        )
    )
}
