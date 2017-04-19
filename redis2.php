<?php

header("Content-Type:text/plain");
//ini_set('display_errors', '0');
$host = gethostname();
$f_redises = shell_exec('find /etc/redis/ -type f -name \'*.conf\' -print0 | xargs -0 grep \'port \'');

$f_redises = explode("\n", $f_redises);
//print_r($f_redises) ;

$f_redises = array_filter($f_redises);

foreach ($f_redises as $key) {
    preg_match("|redis\/(.*?)\/(.*port )(\d\d\d\d)?|sei", $key, $matches);

    if (!empty($matches[3])) {
        //echo $matches[1]." <BR>". $matches[3];
        //echo "<BR>checking redis $matches[1] port $matches[3]...<BR>";

        try {
            $redis = new Redis();
            $a = $redis->connect('127.0.0.1:' . $matches[3]);
            $redis->ping();


        } catch (RedisException $e) {
            echo("$host: Cannot connect to redis server: $matches[1] : $matches[3] " . $e->getMessage() . "\n");
            //exit('Connect error to $matches[1] $matches[3]');
        }
        if ($a == 1) {
            //$role = $redis->info()["role"];
            //$N_tcp =$redis->info()["connected_clients"];
            //echo $role,"\n";
            //$cpu = $redis->info("CPU");
            // print_r($cpu);

            $rnd1 = rand(10000, 1000000);
            $zbx_key = "Zabbixtest" . $rnd1;
            //echo $zbx_key;

            $redis->set($zbx_key, '1');
            $writeok = $redis->exists($zbx_key);
            if (empty($writeok)) echo "$host: write to redis failed.  $matches[1] : $matches[3] ";
            $redis->delete($zbx_key);
        }


    }


}

?>

