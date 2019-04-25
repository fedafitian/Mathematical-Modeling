# PROBLEM: Flour beetles with an initial 112 individiuals are grown in a laboratory are counted daily for 15 
# days. Assuming that the beetle population grows according to the logistic differential equation
# (dy/dt) = ay + by^2, where y[t] is the population size at time t, estimate the values of the parameters a and b.

# DESCRIPTION OF PROGRAM: 
# Program computes 15 points, ((y[t+h] - y[t])/y[t], y[t]) and then plots/determines the best fit line.
# From plot, a and b parameters are able to be located.
# Logistic differential equation is re-written in linear format: dy/dt)/y = a + by
# Derivative is approximated using: y[t+h] - y[t])/h, h=1


# Recorded data across 16 days
y = c(112, 152, 212, 258, 306, 309, 315, 310, 
      298, 290, 303, 295, 311, 308, 299, 309)

t = seq(0, length(y)-1)   # Time in days, minus one for the beetle count across 15 days

plot(t, y, main = "Daily beetle counts", 
           type = "o", 
           xlab = "days", 
           ylab = "beetles")

y_1 = y[-length(y)]   # Removes last data point

par(ask=TRUE)         # This allows for a pause between plots

# Creates a rate vector to load with computed rates
scaled_rate = 0
for(i in 1:(length(y)-1)) {
    scaled_rate[i] = (y[i+1] - y[i])/y[i]
}
#print(rate)

# Plot 15 points and compute best line for them
plot(y_1, scaled_rate, col = "red", main = "Least square fit to scaled rates")

best_fit_line = lm(scaled_rate~y_1)       # Computes line using lm() and save
abline(best_fit_line)                     # Adds the graph of the line 
print(best_fit_line)                      # Prints intercept and slope of line

#Statistical Commands  
#print(summary(best_fit_line))  # Includes R-squared value
#plot(best_fit_line)            # Outputs four plots about the statistics of fit
