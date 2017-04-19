<?php


//echo 'start'.PHP_EOL;
    if(empty($argv[1]))
        exit;

    if(($argv[1])=='ssp') {

        $url='http://scanner.c8.net.ua/c8scanner.php?method=getTrafficStat&type=dsp&key=&keyd=ssp&ssp_id=' . $argv[2] . '&site_id=&format_id=&viacustom=keyd&period=h&timeEnd=0';
        $sspCalls = json_decode(file_get_contents($url), true);

        //print_r($sspCalls);
        //if (empty($ssp_total)) $ssp_total=0 ;
        if (array_key_exists('ssp',$sspCalls['via'])) {
            $ssp_total = $sspCalls['via']['ssp']['c'];
            echo $ssp_total;
        } else {
            echo 0;
        }


    } else {

        $url = 'http://scanner.c8.net.ua/c8scanner.php?method=getTrafficStat&type=dsp&key=&keyd=hit_ok&ssp_id=' . $argv[1] . '&site_id=&format_id=&viacustom=keyd&period=h&timeEnd=0';
        $dspCalls = json_decode(file_get_contents($url), true);
        $hits = $dspCalls['via']['hit_ok']['c'];

        echo $hits;

    }


        //print_r($dspCalls);

?>