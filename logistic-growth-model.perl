#!/usr/bin/perl -w
use strict;

# DESCRIPTION : Logistic Model Iteration, Write to File
# This program uses the following discrete logistic model to govern the growth of a single population 
# with 12 non-overlapping generations:
# x[n+1] = r * x[n] * (1.0 - x[n])

# Create Variables
my $growth_rate = 3.1;
my $population = 0.43;
my $num_of_generations = 12;

# Create a new file
my $filename = "Logistic_growth_model";

# Open
open(FILE_TO_WRITE, ">", $filename)
    or die "Cannot open $filename to write : $!";

# For Loop to do iterations
for (my $year = 0; $year <= $num_of_generations; $year++) {
    print FILE_TO_WRITE "At year $year, the population density is $population \n";
    $population = $growth_rate * $population * (1.0 - $population);
}

# Close the File
close(FILE_TO_WRITE);

# Check if file exists (in directory)
if (-e $filename){
    print "Logistic growth model was written to a file successfully! \n";
    print "Please look for the \"$filename\" file in your Perl directory \n";
}