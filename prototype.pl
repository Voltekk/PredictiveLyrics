use strict;
use warnings;
use Lingua::EN::Ngram;
use File::Slurp qw /read_file/;
use Text::TermExtract;


my @songs = querysongs("Enter the songs you wish to input in the play order (please delimit by semicolon)\n");

print "$_\n" for @songs;

push @songs, "";

my @fulllist;
my @keypredictlist;


for(my $counter0 = 0; $counter0 < $#songs; $counter0++){
    my $toread = $songs[$counter0];
    my @list;
    push @list, splittosections(readsong($toread));
    push @list, " ";
    for(my $counter1 = 0; $counter1 < $#list; $counter1++){
	my $keys = keywords($list[$counter1],3);
	push @keypredictlist, $keys;
	push @fulllist, $keys;
	push @fulllist, $list[$counter1];
	push @fulllist, $keys;
    }
    
}

print "$_\n============\n" for @fulllist;

=pod
my @songkeys;

for(my $counter1 = 0; $counter1 < $#songs;
=cut

######################################################################################

sub querysongs{
    my ($query) = @_;
    local $| = 1;
    print $query;
    chomp (my $song = <STDIN>);
    my @songlist = split /;/, $song;
    return @songlist;
	}
	
	
sub readsong{
	use File::Slurp;
	my $songtoread = shift;
	my $file = read_file($songtoread);
	print $file;
	return $file;
}

sub splittosections{
	my $input = shift; 
	my @sections = split(/\n/, $input);
	return @sections;
}

sub keywords{
	my $songtoparse = shift;
	my $number = shift;
	my $extract = Text::TermExtract->new();
	my @keywordholder;
	$extract->exclude(['the','may']);
	for my $keywords($extract->terms_extract($songtoparse,{max=>$number})){
		push @keywordholder, $keywords;
	}
	my $keysequence = $keywordholder[0].$keywordholder[$1].$keywordholder[2];
	return $keysequence;
}
