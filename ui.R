pageWithSidebar(
    headerPanel('Sarracenia Pitcher Plant Simulator'),
    sidebarPanel(
        selectInput('var', 'View:', 
                    c("Oxygen",
                      "Photosynthesis",
                      "Biological Oxygen Demand",
                      "Food Amount",
                      "Nutrients",
                      "Augmentation Value",
                      "Control"
                      ),selected = 'Oxygen'),
        numericInput('days', 'Simlation Length (Days)', 5,
                     min = 1, max = 10),
        numericInput('foodWeight', 'Prey (mg/mL)', 5,
                     min = 0, max = 100, step = 1), 
        numericInput('nfeeds', 'Number of Feedings', 2,
                     min = 0, max = 10, step = 1),
        selectInput('decyc', 'Decycle', 
                    c('TRUE','FALSE'),selected = 'FALSE')
        numericInput('lag', 'Phase Plot Lag', 
                     10, min = 1, max = 1440, 
                     step = 10),
        numericInput('beta', 'decomposition rate (beta)', 
                     2e-05, min = 0, max = 1, 
                     step = 1e-06),
        numericInput('k', 'half-saturation (k)', 
                     2, min = 0, max = 10, 
                     step = 0.01),
        numericInput('d', 'd mineralization term', 
                     5, min = 0, max = 100, 
                     step = 0.1),
        numericInput('s', 's mineralization term', 
                     1, min = 0, max = 100, 
                     step = 0.1),
        numericInput('c', 'scaling constant (c)', 
                     1, min = 0, max = 100, 
                     step = 1),
        numericInput('feedingTime', 'Feeding Time!', 
                     720, min = 1, max = 1440, 
                     step = 1)
        ),
    mainPanel(
        plotOutput('plot1')
       ,
        plotOutput('plot2')
        )
    )
