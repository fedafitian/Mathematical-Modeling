# DESCRIPTION : Error vs Step Size in Euler, Best Fit Line
# The global error bound in Euler's algorithm is proportional to the indicated step size.
# This program will plot the best fit line for seven different step sizes, displaying the errors 
# against the step sizes and likewise the proportionality constant by taking the slope.

# Write to PNG
png("Error_vs_StepSize.png", width = 700, height = 700)

# Create vector to hold step sizes
step_size = c(0.0020, 0.0050, 0.0100, 0.0200, 0.0400, 0.0700, 0.1000)

# Create vector to hold the global error
# Global error values calculated using Phaser
global_error = c(0.0027133078, 0.006764706, 0.0134679991, 0.0266937994,
0.052445497, 0.095246482, 0.1245393684)

# Plot errors against step size
plot(step_size, global_error, main = "Error vs. Step Size",
        font.main = 17,
        font.lab = 16,
        ylim = c(0, 0.122),
        xlim = c(0, 0.122),
        xlab = "Step Size",
        ylab = "Global Error",
        pch = 18,
        col.main = "darkgreen",
        col.lab = "darkgreen",
        col.axis = "purple4",
        col = "green4",
        cex.main = 1.75, cex.lab = 1.2, cex.axis = 1)

# Create best fit line
best_fit_line = lm(global_error ~ step_size)

# Display best fit line
abline(best_fit_line, col = "red")

# Display statistics, such as slope and y intercept
print(summary(best_fit_line))
print(coef(best_fit_lint))

# Legend Creation
legend("bottomright", legend = c("Best Fit Line"),
lty = 1,
col = c("red"))
dev.off()
