<?php

function random($panjang){
    $karakter = '';
    $karakter .= 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'; // karakter alfabet (upper)
    $karakter .= 'abcdefghijklmnopqrstuvwxyz'; // karakter alfabet (lower)
    $karakter .= '1234567890'; // karakter numerik
    $string = '';
    for ($i=0; $i < $panjang; $i++) { 
        $pos = rand(0, strlen($karakter)-1);
        $string .= $karakter{$pos};
    }
    return $string;
}

function main(){
    echo " Jumlah : ";
    $jumlah = trim(fgets(STDIN));
    echo "\n";
    for ($i=0; $i < $jumlah; $i++){
        if ($i == 6){
            echo " 5Xk0e84Bkr\n";
        } else {
            echo " ".random(10)."\n";
        }
    }
}

main();

?>