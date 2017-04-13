if (!'sarModel' %in% installed.packages()[,1]){
    if (!'devtools' %in% installed.packages()[,1]){
        install.packages('devtools')
    }
    library(devtools)
    install_github('HFpostdoc/sarModel',ref = 'master')
}
library(sarModel)

function(input, output, session) {

  # Combine the selected variables into a new data frame
  runSim <- reactive({
      ppSim(days = input$days,
            foodWeight = c(rep(input$foodWeight * 5,input$nfeeds),
                rep(0,10)),
            beta = input$beta,
            d = input$d,
            s = input$s,
            c = input$c,
            feedingTime = input$feedingTime,
            decycle = input$decyc
            )
  })
  

  plot.var <- reactive({
      input$var
  })

  output$plot1 <- renderPlot({
    par(mar = c(5.1, 4.1, 0, 1))
    plot(runSim()[,plot.var()],
         type = 'p',
         pch = 19,
         col = rainbow(input$days*1440,end = 0.8),
         xlab = 'Minute (t)',
         ylab = plot.var(),
         cex = 2)
  })

  output$plot2 <- renderPlot({
    par(mar = c(5.1, 4.1, 0, 1))
    lagplot(runSim()[,plot.var()],
            k =input$lag,type = 'p',
            col = rainbow(input$days*1440,end = 0.8),
            xlab = '',ylab = '',
            cex = 2)
  })

}
