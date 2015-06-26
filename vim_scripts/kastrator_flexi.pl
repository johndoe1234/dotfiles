#!/usr/bin/perl
#
#

my(@dirContent);
@dirContent = <*>;
my($file_name);
open(OUTPUT, ">syslog_all.log");
foreach $fileName (@dirContent)
{
	#print "$fileName\n";
	if($fileName =~/SYSLOG.*\.log/i)
	{
		delejtSzit($fileName);
	}
}
print "finisz\n";
exit;
close(OUTPUT);

exit;

sub delejtSzit
{
	open (LOGFAJL,"@_");
	print "@_ \n";
	my(@lines) = <LOGFAJL>;
	my($line);
	foreach $line (@lines)
	{
		chomp($line);
		#$line =~s/\r//
		$line =~s/\r\r//;
		#numerki
		$line =~s/^\d* //;
		#data
		$line =~s/^\d\d.\d\d //;
		#$line =~s/<\d*\..*\:.*\d>\s\S*\s//;
		#data z czasu karty
		$line =~s/<\d*\.\d*\s/</;
		#dwa zbedne znaczki
		$line =~s/]\s\s..\s/] /;
		#zbedne znaczki po czasie karty
		$line =~s/>\s.....\s/> /;
		#IP
		$line =~s/\[\d*\.\d*\.\d*\.\d*\]//;
		$line =~s/        return new NormalState;
\/TUP\///;
		$line =~s/.*\/TRSW\/.*//;
		$line =~s/.*\/BM\/.*//;
		$line =~s/.*\/LFS\/.*//;
		$line =~s/.*\/LFS\/.*//;
		$line =~s/.*\/TECHREP,.*//;
		$line =~s/.*\/OPT,.*//;
		$line =~s/.*\/PARA,.*//;
		$line =~s/.*\/DISP,.*//;
		$line =~s/.*\/UHNDSD,.*//;
		$line =~s/.*\/Mediator,.*//;
		$line =~s/.*\/COM_Mediator,.*//;
		$line =~s/.*\/binarylog:.*//;
		$line =~s/.*\/GNSSReceiver.*//;
		$line =~s/.*\/GNSSService.*//;
		$line =~s/.*0-HWRTime.*//;
		#$line =~/(\d+:\d+:\d+\.\d+)(\s+)(.*)/;
		#$line = $1."\t".$3;
		if($line =~/^$/)
		{
	
		}
		else
		{
			print OUTPUT "$line\n";
		}
	}
	
	close(LOGFAJL);
}


