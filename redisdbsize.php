<?php

error_reporting(0);

try {
    if(is_numeric($argv[1]))
    {
        $r = new Redis();
	$r->pconnect("127.0.0.1",$argv[1],2);
        echo round(($r->info('memory')['used_memory'])/(1024*1024),2);
    }
    else
    {
	echo "-1";
    }
}
catch (Exception $e)
{
    echo "-2";
}

?>
