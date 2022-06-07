#' updateCircularSlider
#'
#' @export
updateCircularSlider <- function(session, id, value) {
    session$sendCustomMessage(
        "updateCisl",
        list(
            id = id,
            value = value
        )
    )
}
