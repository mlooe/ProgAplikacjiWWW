<?php
    /**
     * Plik laboratoryjny który prezentuje podstawy składni PHP
     * Demonstracja instrukcji warunkowych, pętli i includowania plików
     */

    $nr_indeksu = '175033';
    $nrGrupy = '2';
    echo 'Wiktor Krasiński '.$nr_indeksu.' grupa '.$nrGrupy. ' <br /><br />';

    // Include
    echo 'Zastosowanie metody include(): <br/>';
    include 'test1.php';
    // Zmienne $color i $fruit pochodzą z test1.php
    echo "A $color $fruit <br/><br/>";

    // Require
    echo 'Zastosowanie metody require_once: <br/>';
    echo 'nie ma błędu więc działa <br/><br/>';
    require_once 'test1.php';

    // Warunki (if, elseif, switch)
    echo 'Zastosowanie metody if, else, elseif, switch: <br/>';

    // Zmienne $a i $b zdefiniowane w test1.php
    if($a > $b){
        echo "a ($a) is bigger than b ($b)<br/>";
    }
    elseif ($a == $b){
        echo "a ($a) is equal to b ($b)<br/>";
    }
    else{
        echo "a ($a) is smaller than b ($b) <br/>";
    }

    // Zmienna $i zdefiniowana w test1.php
    switch ($i){
    case 0:
        echo "i equals 0 <br/><br/>";
        break;
    case 1:
        echo "i equals 1 <br/><br/>";
        break;
    case 2:
        echo "i equals 2 <br/><br/>";
        break;
    }

    // Pętle (while, for)
    echo 'Zastosowanie pętli while i for: <br/>';
    
    while ($i <= 10){
        echo "i = ", $i++, "<br/>";
    }

    for ($i = 1; $i <= 20; $i++) {
        echo "x = ", $i, "<br/>";
    }

    echo '<br/> Zastosowanie $_GET, $_POST, $_SESSION <br/>';

    // Zabezpieczenie danych wejściowych
    if(isset($_GET["name"])){
        echo 'Hello ' . htmlspecialchars($_GET["name"]) . '!'; 
    }
?>