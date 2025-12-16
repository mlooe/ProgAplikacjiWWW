<?php
// Funkcja dodająca nową kategorię
function DodajKategorie($link, $nazwa, $matka_id = 0) {
    $nazwa_db = mysqli_real_escape_string($link, $nazwa);
    $matka_id = (int)$matka_id; 

    $sql = "INSERT INTO kategorie (nazwa, matka) VALUES ('$nazwa_db', '$matka_id')";

    if (mysqli_query($link, $sql)) {
        return "<p style='color:green;'>Kategoria '$nazwa' dodana pomyślnie.</p>";
    } else {
        return "<p style='color:red;'>Błąd: " . mysqli_error($link) . "</p>";
    }
}

// Funkcja edytująca istniejącą kategorię
function EdytujKategorie($link, $id, $nowa_nazwa, $nowa_matka_id) {
    $id = (int)$id;
    $nowa_nazwa_db = mysqli_real_escape_string($link, $nowa_nazwa);
    $nowa_matka_id = (int)$nowa_matka_id;

    $sql = "UPDATE kategorie SET nazwa = '$nowa_nazwa_db', matka = '$nowa_matka_id' WHERE id = '$id' LIMIT 1";

    if (mysqli_query($link, $sql)) {
        if (mysqli_affected_rows($link) > 0) {
            return "<p style='color:green;'>Kategoria ID: $id zaktualizowana pomyślnie.</p>";
        } else {
            return "<p style='color:orange;'>Brak zmian lub kategoria nie istnieje.</p>";
        }
    } else {
        return "<p style='color:red;'>Błąd: " . mysqli_error($link) . "</p>";
    }
}

// Funkcja usuwająca kategorię
function UsunKategorie($link, $id) {
    $id = (int)$id;

    // Przeniesienie ewentualnych podkategorii do głównego poziomu (matka = 0)
    mysqli_query($link, "UPDATE kategorie SET matka = 0 WHERE matka = $id");

    $sql = "DELETE FROM kategorie WHERE id = '$id' LIMIT 1";

    if (mysqli_query($link, $sql)) {
        if (mysqli_affected_rows($link) > 0) {
            return "<p style='color:red;'>Kategoria ID: $id usunięta pomyślnie. Podkategorie przeniesione na poziom główny.</p>";
        } else {
            return "<p style='color:red;'>Błąd: Kategoria o ID: $id nie istnieje.</p>";
        }
    } else {
        return "<p style='color:red;'>Błąd: " . mysqli_error($link) . "</p>";
    }
}

// FUNKCJE WYŚWIETLANIA KATEGORII I FORMULARZY

/**
 * Pobiera wszystkie kategorie
 */
function PobierzWszystkieKategorie($link) {
    $q = "SELECT id, nazwa, matka FROM kategorie ORDER BY matka, nazwa";
    $res = mysqli_query($link, $q);
    $categories = [];
    while ($row = mysqli_fetch_assoc($res)) {
        $categories[] = $row;
    }
    return $categories;
}

/**
 * Funkcja rekurencyjna wyświetlająca drzewo kategorii z opcjami edycji/usunięcia
 * Wykorzystana w ZarzadzajKategoriami()
 */
function WyswietlDrzewoKategorii($parent_id, $categories, $level = 0) {
    $html = "";
    
    foreach ($categories as $category) {
        if ($category['matka'] == $parent_id) {
            $indent = str_repeat("&nbsp;&nbsp;&nbsp;&nbsp;", $level);
            
            $html .= "
                <li>
                    {$indent}ID: {$category['id']} | 
                    <b>{$category['nazwa']}</b> 
                    (Matka: {$category['matka']})
                    <a href='admin.php?akcja=edytuj_kat&id={$category['id']}'>[edytuj]</a>
                    <a href='admin.php?akcja=usun_kat&id={$category['id']}' 
                       onclick='return confirm(\"Czy na pewno usunąć kategorię {$category['nazwa']}?\")'>[usuń]</a>
                </li>";
            
            $html .= WyswietlDrzewoKategorii($category['id'], $categories, $level + 1);
        }
    }
    return $html;
}

/**
 * Główna funkcja panelu do zarządzania kategoriami (widok listy i formularz dodawania)
 */
function ZarzadzajKategoriami($link) {
    // Obsługa dodawania
    if (isset($_POST['dodaj_kat_submit'])) {
        $nazwa = $_POST['nazwa_kat'];
        $matka = $_POST['matka_kat'];
        echo DodajKategorie($link, $nazwa, $matka);
    }
    
    // FORMULARZ DODAWANIA
    echo "<h3>Dodaj Nową Kategorię</h3>";
    
    $wszystkie_kategorie = PobierzWszystkieKategorie($link);
    $opcje_matka = "<option value='0'>[0] Kategoria Główna (BRAK)</option>";
    
    // Generowanie opcji dla pola 'matka'
    foreach ($wszystkie_kategorie as $kat) {
        $opcje_matka .= "<option value='{$kat['id']}'>[{$kat['id']}] {$kat['nazwa']}</option>";
    }

    echo "
        <form method='post'>
            Nazwa Kategorii:<br>
            <input type='text' name='nazwa_kat' required><br><br>

            Kategoria Nadrzędna (Matka):<br>
            <select name='matka_kat'>
                {$opcje_matka}
            </select><br><br>

            <input type='submit' name='dodaj_kat_submit' value='Dodaj Kategorię'>
        </form>
    ";

    // LISTA KATEGORII (DRZEWO)
    echo "<h3>Istniejące Kategorie (Drzewo)</h3>";
    
    if (empty($wszystkie_kategorie)) {
        echo "<p>Brak zdefiniowanych kategorii.</p>";
    } else {
        echo "<ul>";
        // Rozpoczęcie wyświetlania drzewa od ID matki = 0
        echo WyswietlDrzewoKategorii(0, $wszystkie_kategorie);
        echo "</ul>";
    }
}

/**
 * Formularz do edycji kategorii
 */
function FormularzEdycjiKategorii($link, $id) {
    $id = (int)$id;
    
    // Część zapisu zmian
    if (isset($_POST['zapisz_kat'])) {
        $nazwa = $_POST['nazwa_kat'];
        $matka = $_POST['matka_kat'];
        echo EdytujKategorie($link, $id, $nazwa, $matka);
    }
    
    // Część pobrania danych do formularza
    $q = "SELECT * FROM kategorie WHERE id='$id' LIMIT 1";
    $res = mysqli_query($link, $q);
    $dane = mysqli_fetch_array($res);

    if (!$dane) {
        echo "<p style='color:red;'>Błąd: Kategoria o ID $id nie istnieje.</p>";
        return;
    }
    
    // Generowanie opcji dla listy rozwijanej 'matka'
    $wszystkie_kategorie = PobierzWszystkieKategorie($link);
    $opcje_matka = "<option value='0'>[0] Kategoria Główna (BRAK)</option>";
    
    foreach ($wszystkie_kategorie as $kat) {
        // Nie można ustawić kategorii jako matki dla samej siebie
        if ($kat['id'] == $id) continue;
        
        $selected = ($kat['id'] == $dane['matka']) ? 'selected' : '';
        $opcje_matka .= "<option value='{$kat['id']}' {$selected}>[{$kat['id']}] {$kat['nazwa']}</option>";
    }
    
    echo "
        <h3>Edycja Kategorii (ID: $id)</h3>
        <form method='post'>
            Nazwa Kategorii:<br>
            <input type='text' name='nazwa_kat' value='{$dane['nazwa']}' required><br><br>

            Kategoria Nadrzędna (Matka):<br>
            <select name='matka_kat'>
                {$opcje_matka}
            </select><br><br>

            <input type='submit' name='zapisz_kat' value='Zapisz zmiany'>
        </form>
        <p><a href='admin.php?akcja=kategorie'>&laquo; Powrót do zarządzania kategoriami</a></p>
    ";
}
?>