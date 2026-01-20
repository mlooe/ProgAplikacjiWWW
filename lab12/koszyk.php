<?php
session_start();

/**
 * Proceduralna obsługa koszyka sklepowego
 * Wykorzystuje strukturę sesji opartą na tablicy jednowymiarowej
 */

/**
 * Dodaje produkt do koszyka (lub aktualizuje ilość)
 */
function dodajDoKoszyka($idProd, $tytul, $cenaNetto, $vat, $ileSztuk = 1)
{
    if (isset($_SESSION['count'])) {
        $max = $_SESSION['count'];
        for ($i = 1; $i <= $max; $i++) {
            if (isset($_SESSION[$i . '_1']) && $_SESSION[$i . '_1'] == $idProd) {
                $obecnaIlosc = $_SESSION[$i . '_2'];
                $_SESSION[$i . '_2'] = $obecnaIlosc + $ileSztuk;
                return;
            }
        }
    }

    if (!isset($_SESSION['count'])) {
        $_SESSION['count'] = 1;
    } else {
        $_SESSION['count']++;
    }

    $nr = $_SESSION['count'];

    $nr_0 = $nr . '_0';
    $nr_1 = $nr . '_1';
    $nr_2 = $nr . '_2';
    $nr_3 = $nr . '_3';
    $nr_4 = $nr . '_4';
    $nr_5 = $nr . '_5';

    $_SESSION[$nr_0] = $nr;
    $_SESSION[$nr_1] = $idProd;
    $_SESSION[$nr_2] = $ileSztuk;
    $_SESSION[$nr_3] = $tytul;
    $_SESSION[$nr_4] = $cenaNetto;
    $_SESSION[$nr_5] = $vat;
}

/**
 * Usuwa produkt z koszyka
 */
function usunZKoszyka($nr)
{
    if (isset($_SESSION[$nr . '_0'])) {
        unset($_SESSION[$nr . '_0']);
        unset($_SESSION[$nr . '_1']);
        unset($_SESSION[$nr . '_2']);
        unset($_SESSION[$nr . '_3']);
        unset($_SESSION[$nr . '_4']);
        unset($_SESSION[$nr . '_5']);
    }
}

/**
 * Edytuje ilość sztuk
 */
function edytujIlosc($nr, $nowaIlosc)
{
    if (isset($_SESSION[$nr . '_2'])) {
        $_SESSION[$nr . '_2'] = $nowaIlosc;
    }
}

/**
 * Wyświetla zawartość koszyka (zwraca HTML)
 */
function pokazKoszyk()
{
    if (!isset($_SESSION['count']) || $_SESSION['count'] == 0) {
        return "<section><p>Twój koszyk jest pusty.</p></section>";
    }

    $wynik = "<section><h2>Twój koszyk</h2>";
    $wynik .= "<table>";
    $wynik .= "<thead><tr>
            <th>Produkt</th>
            <th>Cena Netto</th>
            <th>VAT</th>
            <th>Cena Brutto</th>
            <th>Ilość</th>
            <th>Wartość Brutto</th>
            <th>Akcje</th>
          </tr></thead><tbody>";

    $suma_wartosci = 0;
    $max_count = $_SESSION['count'];
    $found_items = false;

    for ($i = 1; $i <= $max_count; $i++) {
        if (isset($_SESSION[$i . '_0'])) {
            $found_items = true;

            $id_prod = $_SESSION[$i . '_1'];
            $ile = $_SESSION[$i . '_2'];
            $tytul = $_SESSION[$i . '_3'];
            $cena_n = $_SESSION[$i . '_4'];
            $vat = $_SESSION[$i . '_5'];

            $cena_brutto = $cena_n * (1 + $vat / 100);
            $wartosc_brutto = $cena_brutto * $ile;
            $suma_wartosci += $wartosc_brutto;

            $wynik .= "<tr>";
            $wynik .= "<td>" . $tytul . "</td>";
            $wynik .= "<td>" . number_format($cena_n, 2) . " zł</td>";
            $wynik .= "<td>" . $vat . "%</td>";
            $wynik .= "<td>" . number_format($cena_brutto, 2) . " zł</td>";

            $wynik .= "<td>
                    <form method='post' action='index.php?idp=koszyk' style='display:inline;'>
                        <input type='hidden' name='akcja' value='update'>
                        <input type='hidden' name='nr' value='$i'>
                        <input type='number' name='ilosc' value='$ile' min='1' style='width:50px'>
                        <input type='submit' value='Zmień'>
                    </form>
                  </td>";

            $wynik .= "<td>" . number_format($wartosc_brutto, 2) . " zł</td>";

            $wynik .= "<td>
                    <form method='post' action='index.php?idp=koszyk' style='display:inline;'>
                        <input type='hidden' name='akcja' value='remove'>
                        <input type='hidden' name='nr' value='$i'>
                        <input type='submit' value='Usuń' style='color:red;'>
                    </form>
                  </td>";
            $wynik .= "</tr>";
        }
    }

    $wynik .= "</tbody></table>";

    if (!$found_items) {
        $wynik = "<section><p>Koszyk jest pusty (wszystkie produkty usunięte).</p></section>";
    } else {
        $wynik .= "<h3 style='text-align:right; margin-top:10px;'>Łączna wartość zamówienia: " . number_format($suma_wartosci, 2) . " zł</h3>";
        $wynik .= "</section>";
    }

    return $wynik;
}
?>