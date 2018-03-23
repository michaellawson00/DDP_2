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
      
      fileInput('MySpectrum', 'Select the spectrum to evaluate:',
                accept=c('csv','.csv'))
    ),
    
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Histogram ----
      plotlyOutput(outputId = "SpectrumPlot")
      
    )
  )
)