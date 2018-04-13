library(tidyverse)
flight <- read.csv("flights.csv.gz")
head(flight2)
flight2 <- aggregate(cbind(count = AIRLINE_ID) ~ ORIGIN+DEST, 
                     data = flight, 
                     FUN = function(x){NROW(x)})
flight3 <- flight2 %>% filter(count>200) 
flight4 <- subset(flight3,select = c("ORIGIN", "DEST"))
write.csv(flight4, "flight.csv", row.names=FALSE)
