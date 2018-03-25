library(shiny)
library(plotly)

ui <- fluidPage(
  
  # App title ----
  titlePanel("Transmission Spectrum Viewer"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(h4("Description", align = "left"),
                  p("The transmission spectum viewer takes two raw input spectra,
                   plots them in a plotly chart called \"Raw Input\" then divides the sample spectrum
                   by the background
spectrum to give the samples \"Transmission Spectrum\", shown in a second chart.
                   "),
                 h4("Instructions", align = "left"),
                 p("Select from pre-stored sample and background spectra using the list inputs below.
                   "),
            
      
      selectInput("BackgroundSpectrum", "Select background spectrum to use:", 
                  c("Spectrum1", "Spectrum2", "Spectrum3", "Spectrum4", "Spectrum5"),
                  selected = "Spectrum2"),
      selectInput("SampleSpectrum", "Select sample spectrum to use:", 
                  c("Spectrum1", "Spectrum2", "Spectrum3", "Spectrum4", "Spectrum5"),
                  selected = "Spectrum3")
    ),
    
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Histogram ----
      plotlyOutput(outputId = "SpectrumPlot"),
      br(),
      plotlyOutput(outputId = "ProcessedPlot")

    )
  )
)
