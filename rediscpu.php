<?php

error_reporting(0);

try {
    if(is_numeric($argv[1]))
    {
        $r = new Redis();
	$r->pconnect("127.0.0.1",$argv[1]);
	print_r($r->info('cpu')['used_cpu_sys']);

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