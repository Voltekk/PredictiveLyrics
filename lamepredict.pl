use strict;
use warnings;
use utf8;
use Data::Dump qw(dump);
use Algorithm::MarkovChain;
use Path::Class;
use Lingua::EN::Fathom;

my $output = 'c:/Perl/markovout.txt';
open (OUTPUT, '>'.$output) or die;

print "Enter the topic for generation: ";

my $getuserinput = <STDIN>;

chomp $getuserinput;

my @inputs = qw(wearethefree.txt onethingremains.txt victorscrown.txt nothingisimpossible.txt christisenough.txt ourgod.txt go.txt); 
    my $dir = dir(".");
    my $f = "";
    my @symbols = ();
    foreach $f (@inputs) {
        my $file = $dir->file($f);
    	my $linecounter = 0;
        my $wordcounter = 0;
        my $file_handle = $file->openr();
        while( my $line = $file_handle->getline() ) {
    		chomp ($line);
    		my @words = split(' ', $line);
            push(@symbols, @words);
    		$linecounter++;
    		$wordcounter += scalar(@words);
        }
    	print "$linecounter lines, $wordcounter words read from $f\n";
    }   
    my $chain = Algorithm::MarkovChain::->new();
    $chain->seed(symbols => \@symbols, longest => 6);
    foreach (1 .. 20) {
        my @newness = $chain->spew(length   => 30,
                                   complete => [ $getuserinput ]);
	print @newness;
	print "\n\nWould you like to keep this? \t\t";
	my $yesno = <STDIN>;
	chomp $yesno;
	if($yesno =~ /[Yy][Ee][Ss]\n?/){
        	print OUTPUT3 join (" ", @newness), ".\n\n";
		while (<OUTPUT3>){
			s/\]/ /g;
			s/\[/ /g;
		}
	}
    }


close OUTPUT;

my $text_for_analysis = new Lingua::EN::Fathom;
$text_for_analysis -> analyse_file('c:/perl/markovout.txt');
print "Preparing statistics on generated paragraphs: \n\n\n";
print $text_for_analysis -> report;

