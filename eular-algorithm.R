# DESCRIPTION	: This program uses Eular's algorithm to compute the solution of the frictionless planar pendulum.

# Write to PNG
png("Pendulum_with_Euler.png", bg = "lightgray", width = 700, height = 700)

# Variables
step_size = 0.1
num_of_steps = 200 
time = seq(from = 0, to = 200, by = 1)

g = 1		# gravity
l = 1.3	# length
x = 0.7	# initial position
y = 0		# initial velocity

# Output Step 0
cat("Step =", 0, "\t", "Position =", x[1], "\t", "Initial Velocity =", 0, "\n") 

# Output Step 1 to 200
for(i in (1:(num_of_steps))) {
	# Pair of ODE equations
	x[i+1] = x[i] + step_size * y[i]				
	y[i+1] = y[i] + step_size * (-g/l) * sin(x[i])
	
	# Print out values to be compared with Phaser
	cat("Step =", i, "\t", "Position =", x[i+1], "\t", "Velocity =", y[i+1],  		    "\n")
}

# Plot time on x-axis and position (variable x)
# Shows position and the angular velocity of the pendulum
plot(time, x , main = "Pendulum with Euler",
		   xlim = c(0, 200),
		   ylim = c(-2, 2),
		   xlab = "Number of Euler steps with h = 0.1",
		   ylab = "Position (red); Velocity(blue)",
		   col = "red",
		   type = "l",
		   lwd = 2,
		   cex.main = 1.75, cex.lab = 1.25, cex.axis = 1)

# Plot the velocity(variable y) by adding onto existing plot using points()
points(time, y, col = "blue",
          	     type = "l",
                lwd = 2)
dev.off()
