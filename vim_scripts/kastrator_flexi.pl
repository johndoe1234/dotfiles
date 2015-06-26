#!/usr/bin/perl
#
#


$tcom_prints_off=1;
$spmag_prints_off=1;
$swdl_prints_off=1;
$oam_shit_prints_off=1;

$numArgs = $#ARGV + 1;
foreach $argnum (0 .. $#ARGV) {

    print "$ARGV[$argnum]\n";
    if($ARGV[$argnum] =~/tcom/)
    {
        $tcom_prints_off=0;
    }
    if($ARGV[$argnum] =~/oam/)
    {
        $oam_shit_prints_off=0;
        $spmag_prints_off=0;
        $swdl_prints_off=0;
    }
    if($ARGV[$argnum] =~/swdl/)
    {
        $swdl_prints_off=0;
    }
    if($ARGV[$argnum] =~/spmag/)
    {
        $spmag_prints_off=0;
    }
    if($ARGV[$argnum] =~/125/)
    {
        $spmag_prints_off=0;
        $tcom_prints_off=0;
    }
}

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
		$line =~s/.*\/TUP\/.*//;
		$line =~s/.*\/TRSW\/.*//;
		$line =~s/.*\/BM\/.*//;
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
        $line =~s/^\d+:\d+:\d+.\d+\s+$//;


        #if RF
        $line =~s/^\d+:\d+:\d+.\d+\s+FRM.*//;
        $line =~s/^\d+:\d+:\d+.\d+\s+FR1.*//;
        $line =~s/^\d+:\d+:\d+.\d+\s+FR2.*//;
        $line =~s/^\d+:\d+:\d+.\d+\s+LTX.*//;

        if($swdl_prints_off)
        {
            $line =~s/.*\/OAM\/SW_DL.*//;
            $line =~s/.*\/HWA\/SW_DL.*//;
        }


        if($tcom_prints_off)
        {
            $line =~s/.*\/TCOM\/.*//;
            $line =~s/.*TCOMexe.*//;
        }

        if($oam_shit_prints_off)
        {
            $line =~s/.*\/OAM\/OAMGen.*//;
            $line =~s/.*\/OAM\/SIM.*//;
            $line =~s/.*\/OAM\/CLIC.*//;
            $line =~s/.*\/OAM\/DB_CHANGE_LOG.*//;
            $line =~s/.*\/OAM\/APW.*//;
            $line =~s/.*\/OAM\/ALMAG.*//;
            $line =~s/.*\/OAM\/TEST.*//;
            $line =~s/.*\/OAM\/Test.*//;
            $line =~s/.*\/OAM\/CONF.*//;
            $line =~s/.*\/OAM\/HGW.*//;
            $line =~s/.*\/OAM\/CFM.*//;
            $line =~s/.*\/OAM\/RAMLH.*//;
            $line =~s/.*BBC_DEEPER, SFPMonitoring.*//;
            $line =~s/.*BBC_DEEPER, RAN2393.*//;
        }

        if($spmag_prints_off)
        {
            $line =~s/.*\/OAM\/SPMAG.*//;
            $line =~s/^\d+:\d+:\d+.\d+\s+FSP.*//;
        }

        $line =~s/.*\/CCS\/AaFile.*//;
        $line =~s/.*\/CCS\/AaSNTP.*//;
        $line =~s/.*\/CCS\/AaPro.*//;
        $line =~s/.*sys.eac.input.*//;
        $line =~s/.*ddal_ext_alarms_get.*//;
        $line =~s/.*getRnc.*//;
        $line =~s/.*\/HWA\/LED.*//;
        $line =~s/.*\/HWA\/I2C.*//;
        $line =~s/.*HWR.*MessageSender.*//;



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


