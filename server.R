server <- function(input, output) {
  
  S1 <- read.csv("Spectrum1.csv")
  S2 <- read.csv("Spectrum2.csv")
  S3 <- read.csv("Spectrum3.csv")
  S4 <- read.csv("Spectrum4.csv")
  S5 <- read.csv("Spectrum5.csv")
  SpecList <- list(S1 ,S2 ,S3 ,S4 ,S5)
  names(SpecList) <- c("Spectrum1", "Spectrum2", "Spectrum3", "Spectrum4", "Spectrum5")
  
  output$SpectrumPlot <- renderPlotly({
    
    BackChoice <- input$BackgroundSpectrum
    SampChoice <- input$SampleSpectrum
    
    Background <- SpecList[[BackChoice]]
    Sample <- SpecList[[SampChoice]]
    
    data <- data.frame(x = Background$Wavenumber, 
                       Background = Background$Intensity, 
                       Sample = Sample$Intensity)
    
    
      MySpectrum <- Background
      
      xaxis <- list(
        title = "Wavenumber (cm<sup>-1</sup>)",
        range = c(700,3600)
      )
      
      yaxis <- list(
        title = "Intensity (Arb.)"
      )
      
      plot_ly(data = data, x = ~ x) %>%
        add_trace(y = ~Background, name = paste("Background: ", BackChoice), mode = "lines") %>%
        add_trace(y = ~Sample, name = paste("Sample: ", SampChoice), mode = "lines") %>%
        
        layout(xaxis = xaxis,
               yaxis=yaxis,
               title = "Raw Input",
               legend = list(orientation= "h",
                             x = 0.2,
                             y = 0.14))

  })
  
  output$ProcessedPlot <- renderPlotly({
    
    BackChoice <- input$BackgroundSpectrum
    SampChoice <- input$SampleSpectrum
    
    Background <- SpecList[[BackChoice]]
    Sample <- SpecList[[SampChoice]]
    
    data <- data.frame(x = Background$Wavenumber, 
                       Background = Background$Intensity, 
                       Sample = Sample$Intensity)
    
    xaxis <- list(
      title = "Wavenumber (cm<sup>-1</sup>)",
      range = c(700,3600)
    )
    
    yaxis <- list(
      title = "Transmission(%)"
    )
    
    plot_ly(data = data, x = ~ x) %>%
      add_trace(y = ~Sample*100/Background, name = paste("Background: ", BackChoice), mode = "lines") %>%
      
      layout(xaxis = xaxis,
             yaxis=yaxis,
             title = "Transmission Spectrum")
    
  })
  
}

