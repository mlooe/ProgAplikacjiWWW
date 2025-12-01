<?php
    include 'cfg.php';
    include 'showpage.php';
    error_reporting(E_ALL ^ E_NOTICE ^ E_WARNING);
    

    //Dynamiczne ładowanie stron

    $strona = pokaz_podstrone(id: 1);

    if($_GET['idp'] == '') $strona = pokaz_podstrone(id: 1);
    if($_GET['idp'] == 'glowna') $strona = pokaz_podstrone(id: 1);
    if($_GET['idp'] == 'buildings') $strona = pokaz_podstrone(id: 2);
    if($_GET['idp'] == 'contact') $strona = pokaz_podstrone(id: 5);
    if($_GET['idp'] == 'gallery') $strona = pokaz_podstrone(id: 4);
    if($_GET['idp'] == 'jQuery') $strona = pokaz_podstrone(id: 6);
    if($_GET['idp'] == 'rankings') $strona = pokaz_podstrone(id: 3);
    if($_GET['idp'] == 'films') $strona = pokaz_podstrone(id: 7);

?>  

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Projekt 1. Strona na temat największych budynków świata">
    <meta name="author" content="Wiktor Krasiński">
    <meta name="keywords" content="HTML5, CSS3, JavaScript">
    <title>Największe budynki świata</title>
    <link rel="stylesheet" href="css/styles.css">
    <link rel="icon" type="image/x-icon" href="images/icon.ico"> 
    <script src="html/timedate.js"></script>
    <script src="html/kolorujto.js"></script>
</head>

<body onload="startclock()">
    <header>
        <div class="time">
            <div id="zegarek"></div>
            <div id="data"></div>
        </div>
        <h1><b>Największe budynki świata</b></h1>
    </header>

    <nav class="main-nav">
        <ul>
            <li><a href="index.php?idp=glowna">Strona główna</a></li>
            <li><a href="index.php?idp=buildings">Opisy budynków</a></li>
            <li><a href="index.php?idp=rankings">Rankingi</a></li>
            <li><a href="index.php?idp=gallery">Galeria</a></li>
            <li><a href="index.php?idp=contact">Kontakt</a></li>
            <li><a href="index.php?idp=jQuery">jQuery</a></li>
            <li><a href="index.php?idp=films">Filmy</a></li>
            <li class="cog"><img src="images/cog.png" alt="Ustawienia"/></li>
        </ul>
    </nav>

    <main>
        <?php echo $strona; ?>
    </main>

    <footer>
        <nav>
            <ul>
                <li><a href="gallery.html">Galeria zdjęć</a></li>
                <li><a href="contact.html">Kontakt</a></li>
            </ul>
        </nav>
        <p>© 2025 - Najwyższe budynki świata</p>
        <FORM METHOD="POST" NAME="background">
            <INPUT TYPE="button" VALUE="żółty" ONCLICK="changeBackground('#FFF000')"> 
            <INPUT TYPE="button" VALUE="czarny" ONCLICK="changeBackground('#000000')">
            <INPUT TYPE="button" VALUE="biały" ONCLICK="changeBackground('#FFFFFF')">
            <INPUT TYPE="button" VALUE="zielony" ONCLICK="changeBackground('#00FF00')">
            <INPUT TYPE="button" VALUE="niebieski" ONCLICK="changeBackground('#0000FF')">
            <INPUT TYPE="button" VALUE="pomarańczowy" ONCLICK="changeBackground('#FF8000')"> 
            <INPUT TYPE="button" VALUE="szary" ONCLICK="changeBackground('#c0c0c0')">
            <INPUT TYPE="button" VALUE="czerwony" ONCLICK="changeBackground('#FF0000')"> 
        </FORM>
    </footer>
    <?php
    $nr_indeksu = '175033';
    $nrGrupy = '2';
    echo 'Autor: Wiktor Krasiński '.$nr_indeksu.' grupa '.$nrGrupy.' <br /><br />';
    ?>


</body>
</html>