groupUI <- function(id) {
  ns <- shiny::NS(id)
  shiny::tagList(
    shiny::sliderInput(ns("n"), "Observations per group", 1, 100, 20),
    shiny::numericInput(ns("effect"), "Treatment effect", 1),
    shiny::actionButton(ns("simulate"), "Simulate"),
    shiny::plotOutput(ns("plot"))
  )
}
groupServer <- function(id) {
  shiny::moduleServer(id, function(input, output, session) {
    result <- shiny::eventReactive(input$simulate, {
      shiny::req(input$n, !is.null(input$effect))
      simulate_groups(input$n, input$effect)
    }, ignoreNULL = FALSE)
    output$plot <- shiny::renderPlot({
      graphics::boxplot(value ~ group, data = result())
    })
    result
  })
}
