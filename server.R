# Define server logic required to draw a histogram ----
server <- function(input, output) {
  
  # Histogram of the Old Faithful Geyser Data ----
  # with requested number of bins
  # This expression that generates a histogram is wrapped in a call
  # to renderPlot to indicate that:
  #
  # 1. It is "reactive" and therefore should be automatically
  #    re-executed when inputs (input$bins) change
  # 2. Its output type is a plot
  
  output$SpectrumPlot <- renderPlotly({
    
    S1 <- read.csv("Spectrum1.csv")
    S2 <- read.csv("Spectrum2.csv")
    S3 <- read.csv("Spectrum3.csv")
    S4 <- read.csv("Spectrum4.csv")
    S5 <- read.csv("Spectrum5.csv")
    SpecList <- list(S1 ,S2 ,S3 ,S4 ,S5)
    names(SpecList) <- c("Spectrum1", "Spectrum2", "Spectrum3", "Spectrum4", "Spectrum5")
    
    BackChoice <- input$BackgroundSpectrum
    
    Background <- SpecList[[BackChoice]]
    
  
      MySpectrum <- data.frame(Wavenumber = 0, Intensity = 0)
      MySpectrum <- Background
      
      xaxis <- list(
        title = "Wavenumber (cm<sup>-1</sup>)"
      )
      
      yaxis <- list(
        title = "Intensity (Arb.)"
      )
      
      plot_ly(data = MySpectrum, x = ~ Wavenumber, y= ~ Intensity, type = "scatter", mode = "lines") %>%
        layout(xaxis = xaxis,
               yaxis=yaxis,
               title = "RawSpectra")

  })
  
}

