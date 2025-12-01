<?php
require 'cfg.php';

function PokazKontakt()
{
    return "
    <h2>Formularz kontaktowy</h2>

    <form method='post' action='?akcja=wyslij'>
        <label>Twój email:</label><br>
        <input type='email' name='email'><br><br>

        <label>Temat wiadomości:</label><br>
        <input type='text' name='temat'><br><br>

        <label>Treść wiadomości:</label><br>
        <textarea name='tresc' rows='8' cols='50'></textarea><br><br>

        <input type='submit' value='Wyślij'>
    </form>

    <br><br>

    <a href='?akcja=przypomnij'>Przypomnij hasło do panelu</a>
    ";
}

function WyslijMailKontakt($odbiorca)
{
    if (empty($_POST['temat']) || empty($_POST['tresc']) || empty($_POST['email'])) {

        echo "<p style='color:red;'>[nie wypelniles_pola]</p>";
        echo PokazKontakt();
    } else {

        $mail['subject'] = $_POST['temat'];
        $mail['body']    = $_POST['tresc'];
        $mail['sender']  = $_POST['email'];
        $mail['recipient'] = $odbiorca; 

        $header = "From: Formularz kontaktowy <". $mail['sender'].">\n";
        $header .= "MIME-Version: 1.0\nContent-Type: text/plain; charset=utf-8\nContent-Transfer-Encoding: 8bit\n";
        $header .= "x-Sender: <". $mail['sender'].">\n";
        $header .= "X-Mailer: PRapwww mail 1.2\n";
        $header .= "x-Priority: 3\n";
        $header .= "Return-Path: <". $mail['sender'].">\n";

        mail($mail['recipient'], $mail['subject'], $mail['body'], $header);

        echo "<p style='color:green;'>Wiadomosc wyslana!</p>";
    }
}

function PrzypomnijHaslo()
{
    global $login, $pass;

    $odbiorca = "test@gmail.com";
    $subject = "Przypomnienie hasła do panelu admina";
    $body = "Login: $login\nHasło: $pass\n";
    $sender = "testtest@gmail.com";
    $header = "From: System CMS <{$sender}>\n";
    $header .= "MIME-Version: 1.0\nContent-Type: text/plain; charset=utf-8\n";

    mail($odbiorca, $subject, $body, $header);
    echo "<p style='color:green;'>Wysłano przypomnienie hasła na Twój email.</p>";
}

// Obsługa akcji
if (!isset($_GET['akcja'])) {
    echo PokazKontakt();
}
else if ($_GET['akcja'] == 'wyslij') {
    WyslijMailKontakt("adres@gmail.com");
}
else if ($_GET['akcja'] == 'przypomnij') {
    PrzypomnijHaslo();
}
?>