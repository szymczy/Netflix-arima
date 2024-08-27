install.packages("tidyquant")
install.packages("forecast")
install.packages("lifecycle")
library(tidyquant)
library(quantmod)

getSymbols("NFLX", from = '2012-05-21',
           to = "2022-05-20",warnings = FALSE,
           auto.assign = TRUE)
ceny_zamkniecia = NFLX[,4]
length(ceny_zamkniecia) #2517 obserwacji
plot(ceny_zamkniecia, main = ' ', ylim = c(0,750))

##?
ceny_zamkniecia.ts <- ts(ceny_zamkniecia)[1:2517,]
ceny_zamkniecia.ts

#plot(ceny_zamkniecia.ts, )
#plot(ceny_zamkniecia)
#chart_Series(ceny_zamkniecia)
##

summary(ceny_zamkniecia)

library(stats) 
par(mfrow=c(2,1))
acf(ceny_zamkniecia) #lag.max=1) #, main="ACF()")
pacf(ceny_zamkniecia) #, lag.max=365, main="PACF()")

library(forecast)
tsdisplay(ceny_zamkniecia)


#ets(ceny_zamkniecia.ts, model="ZZZ")
fit <- ets(ceny_zamkniecia)
plot(forecast(fit))
