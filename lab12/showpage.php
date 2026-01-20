<?php
/**
 * Logika wyświetlania podstron z bazy danych.
 */

include("cfg.php");


/**
 * Funkcja pobiera treść podstrony z bazy danych na podstawie ID
 */
function pokaz_podstrone($id)
{
    // Zabezpieczenie parametru ID przed atakami XSS/Injection
    $id_clear = htmlspecialchars($id);

    // Użycie zmiennej $link z pliku cfg.php
    global $link;

    // Zapytanie SQL z LIMIT 1, aby pobrać tylko jeden rekord
    $qry = "SELECT * FROM page_list WHERE id='$id_clear' LIMIT 1";

    $result = mysqli_query($link, $qry) or die(mysqli_error($link));
    $row = mysqli_fetch_array($result);

    // Sprawdzenie czy strona istnieje
    if (empty($row['id'])) {
        $web = '[nie_znaleziono_strony]';
    } else {
        $web = $row['page_content'];
    }
    return $web;
}
?>