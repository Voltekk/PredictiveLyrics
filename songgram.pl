use strict;
use warnings;
use File::Slurp;
use Lingua::EN::Ngram;


print "Enter txt file location:\t";
my $inputfile = <STDIN>;
chop $inputfile;
print "Input file, $inputfile, read.\n";
print "Enter a title for the txt file:\t";
my $title = <STDIN>;
chomp $title;
my $textfile = read_file($inputfile);
#still have to create array lists to interate through to remove unimportant words
my $twogramfile = "C:/Perl/2gram.txt";
open(TWOGRAM, '>'.$twogramfile) or die "Can't create file to store 2grams.\n";
#bigrams to sevengrams to sort
my $ngram = Lingua::EN::Ngram->new(file => $inputfile);
my $bigrams = $ngram->ngram(2);
foreach my $bigram(sort {$$bigrams{my $b} <=> $$bigrams{my $a}} keys %$bigrams){
	print TWOGRAM $$bigrams{$bigram}, "\t$bigram\n";
}
print "Bigrams created...\n";
close TWOGRAM;
system('pause');
my $threegramfile = "C:/Perl/3gram.txt";
open(THREEGRAM, '>'.$threegramfile) or die "Can't create file to store 3grams.\n";
my $trigrams = $ngram->ngram(3);
foreach my $trigram(sort {$$trigrams{my $b} <=> $$trigrams{my $a}} keys %$trigrams){
	print THREEGRAM $$trigrams{$trigram}, "\t$trigram\n";
}
print "Trigrams created...\n";
close THREEGRAM;
system('pause');
my $fourgramfile = "C:/Perl/4gram.txt";
open(FOURGRAM, '>'.$fourgramfile) or die "Can't create file to store 4grams.\n";
my $fourgrams = $ngram->ngram(4);
foreach my $fourgram(sort {$$fourgrams{my $b} <=> $$fourgrams{my $a}} keys %$fourgrams){
	print FOURGRAM $$fourgrams{$fourgram}, "\t$fourgram\n";
}
print "Fourgrams created...\n";
close FOURGRAM;
system('pause');
my $fivegramfile = "C:/Perl/5gram.txt";
open(FIVEGRAM, '>'.$fivegramfile) or die "Can't create file to store 5grams.\n";
my $fivegrams = $ngram->ngram(5);
foreach my $fivegram(sort {$$fivegrams{my $b} <=> $$fivegrams{my $a}} keys %$fivegrams){
	print FIVEGRAM $$fivegrams{$fivegram}, "\t$fivegram\n";
}
print "Fivegrams created...\n";
close FIVEGRAM;
system('pause');
my $sixgramfile = "C:/Perl/6gram.txt";
open(SIXGRAM, '>'.$sixgramfile) or die "Can't create file to store 6grams.\n";
my $sixgrams = $ngram->ngram(6);
foreach my $sixgram(sort {$$sixgrams{my $b} <=> $$sixgrams{my $a}} keys %$sixgrams){
	print SIXGRAM $$sixgrams{$sixgram}, "\t$sixgram\n";
}
print "Sixgrams created...\n";
close SIXGRAM;
system('pause');
my $sevengramfile = "C:/Perl/7gram.txt";
open(SEVENGRAM, '>'.$sevengramfile) or die "Can't create file to store 7grams.\n";
my $sevengrams = $ngram->ngram(7);
foreach my $sevengram(sort {$$sevengrams{my $b} <=> $$sevengrams{my $a}} keys %$sevengrams){
	print SEVENGRAM $$sevengrams{$sevengram}, "\t$sevengram\n";
}
print "Sevengrams created...\n";
close SEVENGRAM;
system('pause');
