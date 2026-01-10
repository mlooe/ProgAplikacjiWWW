<?php
// Funkcja sprawdzająca dostepność produktu
function SprawdzDostepnosc($row)
{
    $dzis = date("Y-m-d H:i:s");

    if ($row['data_wygasniecia'] != NULL && $row['data_wygasniecia'] < $dzis)
        return "<span style='color:orange; font-weight:bold;'>Wygasł</span>";

    if ($row['status_dostepnosci'] == 0)
        return "<span style='color:red;'>Niedostępny</span>";

    if ($row['ilosc_magazyn'] <= 0)
        return "<span style='color:red;'>Brak w magazynie</span>";
    return "<span style='color:green;'>Dostępny</span>";
}

// Funkcja zarządzająca produktami 
function ZarzadzajProduktami($link)
{
    echo "<h3>Zarządzanie produktami</h3>";
    echo "<a href='admin.php?akcja=dodaj_prod'>[Dodaj produkt]</a><br><br>";

    $q = "SELECT * FROM produkty ORDER BY id ASC";
    $res = mysqli_query($link, $q);

    while($row = mysqli_fetch_array($res))
    {
        $img = $row['zdjecie'] != "" ? $row['zdjecie'] : "brak_zdjecia.png";

        $data_wyg = $row['data_wygasniecia'] ? date("Y-m-d H:i", strtotime($row['data_wygasniecia'])) : "brak";

        echo "
        <div style='display:flex; align-items:center; gap:20px; margin-bottom:15px;'>

            <div>
                <img src='{$img}' alt='zdjęcie produktu' width='120' height='120' style='object-fit:cover; border:1px solid #ccc;'>
            </div>

            <div>
                ID: {$row['id']} <br>
                <b>{$row['tytul']}</b><br>
                Cena netto: {$row['cena_netto']} zł<br>
                VAT: {$row['podatek_vat']} %<br>
                Ilość w magazynie: {$row['ilosc_magazyn']} <br>
                Status: ".SprawdzDostepnosc($row)." <br>
                Data wygaśnięcia: {$data_wyg} <br>

                <a href='admin.php?akcja=edytuj_prod&id={$row['id']}'>[edytuj]</a>
                <a href='admin.php?akcja=usun_prod&id={$row['id']}'>[usuń]</a>
            </div>

        </div>
        ";
    }
}

// Funkcja dodajawająca nowy produkt
function DodajProdukt($link)
{
    if(isset($_POST['dodaj_prod']))
    {
        $tytul = $_POST['tytul'];
        $opis = $_POST['opis'];
        $cena = $_POST['cena_netto'];
        $vat = $_POST['podatek_vat'];
        $ilosc = $_POST['ilosc_magazyn'];
        $status = isset($_POST['status']) ? 1 : 0;
        $kategoria = $_POST['kategoria'];
        $gabaryt = $_POST['gabaryt'];
        $data_wyg = $_POST['data_wygasniecia'] ?: NULL;
        $zdjecie = $_POST['zdjecie'];

        $q = "INSERT INTO produkty 
        (tytul, opis, data_utworzenia, data_wygasniecia, cena_netto, podatek_vat, ilosc_magazyn, status_dostepnosci, kategoria, gabaryt, zdjecie)
        VALUES
        ('$tytul', '$opis', NOW(), ".($data_wyg ? "'$data_wyg'" : "NULL").",
         '$cena', '$vat', '$ilosc', '$status', '$kategoria', '$gabaryt', '$zdjecie')";

        mysqli_query($link, $q);

        echo "<p style='color:green;'>Dodano produkt.</p>";
    }

    echo "
    <h3>Dodaj produkt</h3>
    <form method='post'>
        Tytuł:<br><input type='text' name='tytul'><br><br>
        Opis:<br><textarea name='opis' cols='60' rows='5'></textarea><br><br>
        Cena netto:<br><input type='number' step='0.01' name='cena_netto'><br><br>
        Podatek VAT (%):<br><input type='number' name='podatek_vat'><br><br>
        Ilość w magazynie:<br><input type='number' name='ilosc_magazyn'><br><br>
        Status dostępności:<input type='checkbox' name='status'> dostępny<br><br>
        Kategoria:<br><input type='text' name='kategoria'><br><br>
        Gabaryt:<br><input type='text' name='gabaryt'><br><br>
        Data wygaśnięcia:<br><input type='datetime-local' name='data_wygasniecia'><br><br>
        Link do zdjęcia:<br><input type='text' name='zdjecie'><br><br>

        <input type='submit' name='dodaj_prod' value='Dodaj produkt'>
    </form>";
}

// Funkcja edytująca istniejący już produkt
function EdytujProdukt($link, $id)
{
    if(isset($_POST['zapisz_prod']))
    {
        $tytul = $_POST['tytul'];
        $opis = $_POST['opis'];
        $cena = $_POST['cena_netto'];
        $vat = $_POST['podatek_vat'];
        $ilosc = $_POST['ilosc_magazyn'];
        $status = isset($_POST['status']) ? 1 : 0;
        $kategoria = $_POST['kategoria'];
        $gabaryt = $_POST['gabaryt'];
        $data_wyg = $_POST['data_wygasniecia'] ?: NULL;
        $zdjecie = $_POST['zdjecie'];

        $q = "UPDATE produkty SET
            tytul='$tytul',
            opis='$opis',
            data_modyfikacji=NOW(),
            data_wygasniecia=".($data_wyg ? "'$data_wyg'" : "NULL").",
            cena_netto='$cena',
            podatek_vat='$vat',
            ilosc_magazyn='$ilosc',
            status_dostepnosci='$status',
            kategoria='$kategoria',
            gabaryt='$gabaryt',
            zdjecie='$zdjecie'
        WHERE id='$id' LIMIT 1";

        mysqli_query($link, $q);

        echo "<p style='color:green;'>Zapisano zmiany.</p>";
    }

    $res = mysqli_query($link, "SELECT * FROM produkty WHERE id='$id' LIMIT 1");
    $row = mysqli_fetch_array($res);

    $checked = $row['status_dostepnosci'] ? "checked" : "";

    echo "
    <h3>Edycja produktu</h3>
    <form method='post'>
        Tytuł:<br><input type='text' name='tytul' value='{$row['tytul']}'><br><br>
        Opis:<br><textarea name='opis' cols='60' rows='5'>{$row['opis']}</textarea><br><br>
        Cena netto:<br><input type='number' step='0.01' name='cena_netto' value='{$row['cena_netto']}'><br><br>
        Podatek VAT:<br><input type='number' name='podatek_vat' value='{$row['podatek_vat']}'><br><br>
        Ilość w magazynie:<br><input type='number' name='ilosc_magazyn' value='{$row['ilosc_magazyn']}'><br><br>
        Status:<input type='checkbox' name='status' $checked> dostępny<br><br>
        Kategoria:<br><input type='text' name='kategoria' value='{$row['kategoria']}'><br><br>
        Gabaryt:<br><input type='text' name='gabaryt' value='{$row['gabaryt']}'><br><br>
        Data wygaśnięcia:<br><input type='datetime-local' name='data_wygasniecia' value='{$row['data_wygasniecia']}'><br><br>
        Zdjęcie – link:<br><input type='text' name='zdjecie' value='{$row['zdjecie']}'><br><br>

        <input type='submit' name='zapisz_prod' value='Zapisz zmiany'>
    </form>";
}

// Funkcja usuwająca produkt
function UsunProdukt($link, $id)
{
    mysqli_query($link, "DELETE FROM produkty WHERE id='$id' LIMIT 1");
    echo "<p style='color:red;'>Produkt usunięty.</p>";
}

?>