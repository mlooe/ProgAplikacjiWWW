<?php
/**
 * Plik konfiguracyjny bazy danych oraz dane logowania administratora.
 */

    // Dane do połączenia z bazą danych
    $dbhost = 'localhost';
    $dbuser = 'root';
    $dbpass = '';
    $db = 'moja_strona';

    // Próba połączenia z bazą danych
    $link = mysqli_connect($dbhost, $dbuser, $dbpass, $db);

    // Sprawdzenie czy połączenie się udało
    if (!$link) echo '<b> przerwane polaczenie </b>';

    // Dane logowania do panelu administratora (statyczne)
    $login = 'admin';
    $pass = 'admin123!';
?>
