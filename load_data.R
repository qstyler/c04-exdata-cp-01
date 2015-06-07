library(dplyr)

load_data <- function() {
    "household_power_consumption.txt" %>%
        read.table(
            header=TRUE,
            sep=";",
            colClasses=c("character", "character", rep("numeric",7)),
            na="?") %>%
        mutate(
            Time = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S") %>%
                as.POSIXct,
            Date = as.Date(Date, "%d/%m/%Y")
        ) %>%
        filter(Date %in%
                   as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
        )

}