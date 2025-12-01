<?php
session_start();
require '..\cfg.php';

// Logowanie
if (!isset($_SESSION['logged_in'])) $_SESSION['logged_in'] = false;
if (isset($_POST['x1_submit']))
{
    if ($_POST['login_email'] == $login && $_POST['login_pass'] == $pass) {
        $_SESSION['logged_in'] = true;
    } else {
        echo "<p style='color:red;'>Błąd logowania! Niepoprawne dane.</p>";
        echo FormularzLogowania();
        exit;
    }
}

if ($_SESSION['logged_in'] !== true) 
{
    echo FormularzLogowania();
    exit;
}

echo "<h2>Panel administracyjny</h2>
<a href='admin.php?akcja=lista'>Lista podstron</a> | 
<a href='admin.php?akcja=dodaj'>Dodaj nową podstronę</a> |
<a href='admin.php?akcja=logout'>Wyloguj</a><br><br>";

if (isset($_GET['akcja']) && $_GET['akcja'] == 'logout') {
    $_SESSION['logged_in'] = false;
    session_destroy();
    header("Location: admin.php");
}


function FormularzLogowania()
{
    $wynik = "
    <div class='logowanie'>
        <h1 class='heading'>Panel CMS:</h1>
        <div class='logowanie'>
            <form method='post' name='LoginForm' enctype='multipart/form-data' action='{$_SERVER["REQUEST_URI"]}'>
                <table class='logowanie'>
                    <tr>
                        <td class='log4_t'>[login]</td>
                        <td><input type='text' name='login_email' class='logowanie'></td>
                    </tr>
                    <tr>
                        <td class='log4_t'>[haslo]</td>
                        <td><input type='password' name='login_pass'class='logowanie'></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td><input type='submit' name='x1_submit' value='Zaloguj' class='logowanie'></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    ";
    return $wynik;
}

function ListaPodstron($link)
{
    $q = "SELECT id, page_title FROM page_list ORDER BY id ASC";
    $res = mysqli_query($link, $q);
    echo "<h3>Lista podstron</h3>";

    while ($row = mysqli_fetch_array($res)) {
        echo "
            ID: {$row['id']} | 
            <b>{$row['page_title']}</b>
            <a href='admin.php?akcja=edytuj&id={$row['id']}'>[edytuj]</a>
            <a href='admin.php?akcja=usun&id={$row['id']}'>[usuń]</a>
            <br>
        ";
    }
}

function EdytujPodstrone($link, $id)
{
    if (isset($_POST['zapisz'])) {

        $title = $_POST['tytul'];
        $content = $_POST['tresc'];
        $active = isset($_POST['active']) ? 1 : 0;

        $update = "UPDATE page_list 
                   SET page_title='$title', page_content='$content', status='$active'
                   WHERE id='$id' LIMIT 1";

        mysqli_query($link, $update);

        echo "<p style='color:green;'>Zapisano zmiany!</p>";
    }

    $q = "SELECT * FROM page_list WHERE id='$id' LIMIT 1";
    $res = mysqli_query($link, $q);
    $dane = mysqli_fetch_array($res);

    $checked = $dane['status'] == 1 ? "checked" : "";
    echo "
        <h3>Edycja podstrony</h3>
        <form method='post'>
            Tytuł: <br>
            <input type='text' name='tytul' value='{$dane['page_title']}'><br><br>

            Treść:<br>
            <textarea name='tresc' rows='10' cols='60'>{$dane['page_content']}</textarea><br><br>

            Aktywna? <input type='checkbox' name='active' $checked><br><br>

            <input type='submit' name='zapisz' value='Zapisz zmiany'>
        </form>
    ";
}

function DodajNowaPodstrone($link)
{
    if (isset($_POST['nowa_submit'])) {

        $title = $_POST['tytul'];
        $content = $_POST['tresc'];
        $active = isset($_POST['active']) ? 1 : 0;

        $insert = "INSERT INTO page_list (page_title, page_content, status) 
                   VALUES ('$title', '$content', '$active')";

        mysqli_query($link, $insert);

        echo "<p style='color:green;'>Dodano nową podstronę!</p>";
    }

    echo "
        <h3>Dodawanie nowej podstrony</h3>
        <form method='post'>
            Tytuł:<br>
            <input type='text' name='tytul'><br><br>

            Treść:<br>
            <textarea name='tresc' rows='10' cols='60'></textarea><br><br>

            Aktywna? <input type='checkbox' name='active'><br><br>

            <input type='submit' name='nowa_submit' value='Dodaj'>
        </form>
    ";
}

function UsunPodstrone($link, $id)
{
    $del = "DELETE FROM page_list WHERE id='$id' LIMIT 1";
    mysqli_query($link, $del);
    echo "<p style='color:red;'>Usunięto podstronę!</p>";
}

// Obsługa akcji
if (isset($_GET['akcja'])) {

    switch ($_GET['akcja']) {

        case "lista":
            ListaPodstron($link);
            break;

        case "edytuj":
            EdytujPodstrone($link, $_GET['id']);
            break;

        case "dodaj":
            DodajNowaPodstrone($link);
            break;

        case "usun":
            UsunPodstrone($link, $_GET['id']);
            break;
    }
}
?>