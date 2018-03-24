library(shiny)
library(plotly)

#require("plotly")



ui <- fluidPage(
  
  # App title ----
  titlePanel("Spectrum Viewer"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      selectInput("BackgroundSpectrum", "Select background spectrum to use:", 
                  c("Spectrum1", "Spectrum2", "Spectrum3", "Spectrum4", "Spectrum5")),
      selectInput("SampleSpectrum", "Select sample spectrum to use:", 
                  c("Spectrum1", "Spectrum2", "Spectrum3", "Spectrum4", "Spectrum5"),
                  selected = "Spectrum5")
    ),
    
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Histogram ----
      plotlyOutput(outputId = "SpectrumPlot"),
      plotlyOutput(outputId = "ProcessedPlot")
      
    )
  )
)
