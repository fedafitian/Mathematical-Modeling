# DESCRIPTION  : Logistic Xi vs. Time plot displaying a population growth rate

# Write to PNG
png("Logistic_Plot", width = 600, height = 600)

r = 3.4	# Growth Rate
x = 0.2 	# Initial condition (population density)


# Output Generation 1 and its initial population density
cat("Growth rate = ", r, "\n")
cat("Generation = ", 1, "\t", "Population density =", x[1], "\n")

# Time needed to recreate plot
number_of_generations = 36

# Create for-loop to calculate the population density for each generation (36 in total)
for(i in (1:(number_of_generations - 1))) {
   x[i+1] = r * x[i] * (1.0 - x[i])
   cat("Generation = ", i+1, "\t", "Population density =", x[i+1], "\n")
}

# Test to see the contents of the array
# print(x)

# Plot time on x-axis, population density on y-axis
time = (0:(number_of_generations - 1))

plot(time, x, main = "Logistic: x_n+1 = r*x_n*(1=x_n); x_0 = 0.2, r = 3.4",
	         ylim = c(0,1.5),
              ylab = "X",
	         xlab = "Time",
              type = "o",
		   lwd = 1,
              col = "red",
		   cex.main = 1.75, cex.lab = 1.25, cex.axis = 1)

dev.off()
