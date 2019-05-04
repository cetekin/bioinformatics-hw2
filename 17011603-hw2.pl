#Student name: Cetin Tekin


#This program uses a sliding window of size 3 and a similarity cutoff of two nucleotides
#Dotplot can be seen in the output.txt file after the execution of program

use strict;


#Opening the input file
open INPUT, "input.txt" or die "Couldn't open the file!";

#Opening the output file
open OUTPUT, ">output.txt" or die "Couldn't open the file!";


#Reading the sequences
my $seq_1 = <INPUT>;
my $seq_2 = <INPUT>;

chomp $seq_1;
chomp $seq_2;

#Printing the second sequence as the firs line
print OUTPUT ("  ".$seq_2."\n");


#Storing window counts of each sequence in iter_1 and iter_2 (including gap at the end of sequences)
my $iter_1 = (length $seq_1) - 1;
my $iter_2 = (length $seq_2) - 1;


for (my $i = 0; $i < $iter_1; $i++) {

        #Printing the line beginning
        print OUTPUT ((substr $seq_1, $i, 1)." ");

        #If there is no gap at the end of one of the two initially compared sequence windows
        my $window_iter = 3;

        #If there is a gap at the end of first sequence window
        if ($i == (length $seq_1) - 2 ) {
                $window_iter = 2;
        }


        for (my $k = 0; $k < $iter_2; $k++) {

                my $match_count = 0;

                #If there is a gap at the end of second sequence window
                if ($k == (length $seq_2) - 2 ) {
                        $window_iter = 2;
                }


                for (my $c = 0; $c < $window_iter; $c++) {

                        #If there is a match between two opposing residues of windows
                        if ( (substr $seq_1, $i+$c, 1) eq (substr $seq_2, $k+$c, 1) ) {
                                $match_count++;
                        }

                }

                if ($match_count >= 2) {
                        print OUTPUT (".");
                }

                else {
                        print OUTPUT (" ");
                }

        }

        print OUTPUT ("\n");

}

#Printing remaining part of the first sequence
for (my $i = $iter_1; $i < length($seq_1); $i++) {
        print OUTPUT ((substr $seq_1, $i, 1)."\n");
}
