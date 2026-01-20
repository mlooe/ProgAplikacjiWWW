<?php
// sklep.php - lista produktów dla klienta
// Powrót stringa zamiast echo

$wynik = "<section><h2>Zapraszamy do zakupów</h2>";

$query = "SELECT * FROM produkty WHERE status_dostepnosci = 1 AND (data_wygasniecia IS NULL OR data_wygasniecia > NOW()) AND ilosc_magazyn > 0 LIMIT 50";
$result = mysqli_query($link, $query);

if (!$result) {
    $wynik .= "Błąd pobierania produktów.";
} else {
    $wynik .= "<div class='gallery'>";

    while ($row = mysqli_fetch_array($result)) {

        $img = $row['zdjecie'] != "" ? $row['zdjecie'] : "img/brak.png";
        $cena_brutto = $row['cena_netto'] * (1 + $row['podatek_vat'] / 100);

        $wynik .= "<div style='border: 1px solid #ddd; padding: 15px; border-radius: 8px; text-align:center;'>";
        $wynik .= "<img src='{$img}' style='max-width:100%; height:200px; object-fit:cover;'><br>";
        $wynik .= "<h3>{$row['tytul']}</h3>";
        $wynik .= "<p>Cena netto: " . number_format($row['cena_netto'], 2) . " zł</p>";
        $wynik .= "<p><b>Cena brutto: " . number_format($cena_brutto, 2) . " zł</b></p>";

        // Formularz dodawania do koszyka
        $wynik .= "<form method='post' action='index.php?idp=sklep'>";
        $wynik .= "<input type='hidden' name='akcja' value='add'>";
        $wynik .= "<input type='hidden' name='id_prod' value='{$row['id']}'>";
        $wynik .= "<input type='hidden' name='tytul' value='{$row['tytul']}'>";
        $wynik .= "<input type='hidden' name='cena_netto' value='{$row['cena_netto']}'>";
        $wynik .= "<input type='hidden' name='vat' value='{$row['podatek_vat']}'>";

        $wynik .= "<label>Ilość: <input type='number' name='ilosc' value='1' min='1' max='{$row['ilosc_magazyn']}' style='width:50px; text-align:center;'></label> ";
        $wynik .= "<br><br><input type='submit' value='Dodaj do koszyka' style='background-color:#4CAF50; color:white; border:none; padding:8px 15px; cursor:pointer; border-radius:4px;'>";
        $wynik .= "</form>";

        $wynik .= "</div>";
    }
    $wynik .= "</div>";
}

$wynik .= "</section>";
return $wynik;
?>