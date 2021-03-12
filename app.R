#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

dat <- drop_na(read_csv(url("https://www.dropbox.com/s/4ebgnkdhhxo5rac/cel_volden_wiseman%20_coursera.csv?raw=1")))

dat <- dat %>% select(c(Congress=congress, Ideology=dwnom1, Party=dem))
dat$Party <- recode(dat$Party, `1`="DEM", `0`="REP")
dat <- drop_na(dat)

ggplot(dat, aes(x=Ideology, color=Party, fill=Party)) + geom_density(alpha=0.5)+
    xlim(-1.5, 1.5)+
    xlab("Ideology - Nominate Score") +
    ylab("Density")+
    scale_fill_manual(values = c("blue", "red")) +
    scale_color_manual(values = c("blue", "red"))

ggplot(dat, aes(x=Ideology, color=Party, fill=Party)) + geom_density(alpha=0.5)+
    xlim(-1.5, 1.5)+
    xlab("Ideology - Nominate Score") +
    ylab("Density")+
    scale_fill_manual(values = c("blue", "red")) +
    scale_color_manual(values = c("blue", "red")) + facet_wrap(~Congress)





# Define UI for application that draws a histogram
ui <- fluidPage(
    # Application title
    titlePanel("Ideology in Congress"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("my_cong",
                        "Congress",
                        min = 93,
                        max = 114,
                        value = 93)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("congress_distplot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$congress_distplot <- renderPlot({
        # generate bins based on input$bins from ui.R
        ggplot(filter(dat, Congress==input$my_cong),
               aes(x=Ideology, color=Party, fill=Party)) + geom_density(alpha=0.5)+
            xlim(-1.5, 1.5)+
            xlab("Ideology - Nominate Score") +
            ylab("Density")+
            scale_fill_manual(values = c("blue", "red")) +
            scale_color_manual(values = c("blue", "red"))
    
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
