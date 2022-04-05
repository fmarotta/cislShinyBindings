circularSliderInput <- function(inputId, label, value) {
    addResourcePath(
        prefix = "wwwCircularSlider",
        directoryPath = system.file("www", package = "cislShinyBindings")
    )
    addResourcePath(
        prefix = "vendorCircularSlider",
        directoryPath = system.file("vendor/circularSlider", package = "cislShinyBindings")
    )
    tagList(
        singleton(tags$head(
            tags$script(src = "vendorCircularSlider/js/circularSlider.js"),
            tags$script(src = "wwwCircularSlider/cislShinyBindings.js"),
            tags$link(rel = "stylesheet", type = "text/css", href = "vendorCircularSlider/css/circularSlider.css")
        )),
        tags$input(type = "text", id = "my-input", class = "circularSlider", "data-height" = 600)
    )
}
