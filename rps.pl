use warnings;
use strict;
use 5.010;
 
use Net::Twitter;
use Config::Tiny;
use Data::Dumper qw(Dumper);
use File::HomeDir;

my $count=0;
my $mycnt=0;
my $compcnt=0;
print "ROCK PAPER SCISSOR\n\n";
while($count<5)
{
	print "please choose 1,2 or 3",'("Rock", "Paper", "Scissor"):';
	my $choice = <STDIN>;
	$choice -= 1;
	my $compChoice = int(rand(2));
	if($choice<0 || $choice>2)
	{
		print "choose valid option../\n";
	}
	else{
		if($choice == 2 && $compChoice == 0 ){
		print "Rock beats scisors, you lose : /\n";
		$compcnt++;
		}
		if($choice == 0 && $compChoice == 1){
			print "Paper beats rock, you lose : /\n";	
			$compcnt++;
		}
		if($choice == 1 && $compChoice == 2){
			print "Scissor beats paper, you lose : /\n";	
			$compcnt++;
		}

		if($choice == 0 && $compChoice == 2){
			print "Rock beats Scissor, you win : /\n";	
			$mycnt++;
		}

		if($choice == 1 && $compChoice == 0){
			print "paper beats rocks, you win : /\n";	
			$mycnt++;
		}

		if($choice == 2 && $compChoice == 1){
			print "Scissor beats paper, you win : /\n";	
			$mycnt++;
		}

		if($choice == $compChoice){
			print "you tied \n";
		}
		$count++;
	}
	
}
if($mycnt>$compcnt)
{
	print " you won the game.. \n";

	my $nt = Net::Twitter->new(
		ssl      => 1,
		traits   => [qw/API::RESTv1_1/],
		consumer_key        => 'tG5CKUAd1HCTalg4F6QavQ1aA',
		consumer_secret     => 'OzPVFq2CRZ39MLOV60MX3KN0S0YjHNOzlWnAmALaCjP78MRZwJ',
		access_token        => '896324447769997312-qh96tPT9n7RhRRrMP8EHjOKLLxHnrns',
		access_token_secret => '2IysCKt5YQyFxaxxS60kzbw6I68dSMteu61oN28T30Ksm',
	);

	my $result = $nt->update('Yippi I WON !');
}
if($mycnt<$compcnt)
{
	print " you lost the game.. \n";
}
if($mycnt==$compcnt)
{
	print " Match tied...\n";
}
