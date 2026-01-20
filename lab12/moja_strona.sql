-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 20, 2026 at 11:48 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `moja_strona`
--

-- --------------------------------------------------------

--
-- Table structure for table `kategorie`
--

CREATE TABLE `kategorie` (
  `id` int(11) NOT NULL,
  `matka` int(11) DEFAULT 0,
  `nazwa` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategorie`
--

INSERT INTO `kategorie` (`id`, `matka`, `nazwa`) VALUES
(1, 0, 'urządzenia'),
(3, 1, 'telefon'),
(4, 1, 'smartfony'),
(5, 1, 'telewizory'),
(6, 0, 'ubrania'),
(7, 6, 'meskie'),
(8, 6, 'damskie'),
(9, 6, 'dzieciece');

-- --------------------------------------------------------

--
-- Table structure for table `page_list`
--

CREATE TABLE `page_list` (
  `id` int(11) NOT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `page_content` text DEFAULT NULL,
  `status` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `page_list`
--

INSERT INTO `page_list` (`id`, `page_title`, `page_content`, `status`) VALUES
(1, 'glowna', '                                                                              <section class=\"intro\">\r\n    <h2>Wprowadzenie</h2>\r\n    <p>Poznaj wieżowce, które sięgają chmur! <br>W tej witrynie znajdziesz najwyższe budynki świata, galerię ze zdjęciami, oraz przeróżne ciekawostki na ich temat!</p>\r\n    <figure>\r\n        <img src=\"images/Burj_Khalifa.jpg\" alt=\"Burj Khalifa\"/>\r\n        <figcaption>Przykład gigantycznej wysokości Burj Khalify (828m)</figcaption>\r\n    </figure>\r\n</section>\r\n\r\n<section class=\"middle\">\r\n    <h2>Co znajdziesz na stronie</h2>\r\n    <ol>\r\n        <li>Opis największych budowli i ich cech</li>\r\n        <li>Rankingi wysokości (tabela) oraz przeróżne ciekawostki</li>\r\n        <li>Galeria zdjęć w różnym układzie</li>\r\n        <li>Kontakt</li>\r\n    </ol>\r\n</section>\r\n\r\n<section class=\"outro\">\r\n    <h2>Wyróżnione budynki</h2>\r\n    <article>\r\n        <h3>Burj Khalifa</h3>\r\n        <p>Najwyższy budynek świata, mający 163 piętra.<a href=\"index.php?idp=buildings\"> Czytaj dalej... -></a></p>\r\n    </article>\r\n\r\n    <article>\r\n        <h3>Shanghai Tower</h3>\r\n        <p>Imponująca wieża z unikalną spiralną formą. <a href=\"index.php?idp=buildings\"> Czytaj dalej... -></a></p>\r\n    </article>\r\n\r\n    <article>\r\n        <h3>The Clock Towers (Abradż al-Bajt)</h3>\r\n        <p>Kompleks hotelowy posiadający ogromny zegar na swoim szczycie. <a href=\"index.php?idp=buildings\"> Czytaj dalej... -></a></p>\r\n    </article>\r\n</section>', 1),
(2, 'buildings', '<section class=\"intro\">\r\n    <h2>Burj Khalifa</h2>\r\n    <p>Ciekawostki na temat Burj Khalify</p>\r\n    <ul>\r\n        <li>Wysokość: 828 metrów, co czyni go najwyższym budynkiem na świecie.</li>\r\n        <li>Projekt inspirowany kształtem kwiatu hymenocallis (pajęcza lilia).</li>\r\n        <li>Posiada jedne z najszybszych wind na świecie, poruszających się z prędkością 10 m/s.</li>\r\n    </ul>\r\n    <figure>\r\n        <img src=\"images/Burj_Khalifa_BottomView.jpg\" alt=\"Zdjęcie Burj Khalifa\" />\r\n        <figcaption>Burj Khalifa - zdjęcie podglądowe z dołu</figcaption>\r\n    </figure>\r\n</section>\r\n<section class=\"intro\">\r\n    <h2>Shanghai Tower</h2>\r\n    <p>Ciekawostki na temat Shanghai Tower</p>\r\n    <ul>\r\n        <li>Skręcona fasada zmniejsza obciążenie wiatrem o 24%.</li>\r\n        <li>Jest to najwyższy budynek w Chinach i posiada najwyżej położony taras widokowy.</li>\r\n        <li>W budowie wykorzystano innowacyjną podwójną fasadę, działającą jak termos.</li>\r\n    </ul>\r\n    <figure>\r\n        <img src=\"images/Shanghai_Tower.jpg\" alt=\"Zdjęcie Shanghai Tower\" />\r\n        <figcaption>Shanghai Tower - zdjęcie podglądowe z daleka</figcaption>\r\n    </figure>\r\n</section>\r\n<section class=\"intro\">\r\n    <h2>Merdeka 118</h2>\r\n    <p>Ciekawostki na temat Merdeka 118</p>\r\n    <ul>\r\n        <li>Kształt iglicy nawiązuje do sylwetki Tunku Abdul Rahmana.</li>\r\n        <li>Nazwa \"Merdeka\" oznacza w języku malajskim \"niepodległość\".</li>\r\n        <li>Jest to drugi pod względem wysokości budynek na świecie.</li>\r\n    </ul>\r\n    <figure>\r\n        <img src=\"images/Merdeka_118.jpg\" alt=\"Zdjęcie Merdeka 118\" />\r\n        <figcaption>Merdeka 118 - zdjęcie ukazujące unikatowy kształt budynku</figcaption>\r\n    </figure>\r\n</section>\r\n<section class=\"intro\">\r\n    <h2>The Clock Towers (Abradż al-Bajt)</h2>\r\n    <p>Ciekawostki na temat Abradż al-Bajt</p>\r\n    <ul>\r\n        <li>Posiada największą na świecie tarczę zegarową o średnicy 43 metrów.</li>\r\n        <li>Kompleks znajduje się w bezpośrednim sąsiedztwie Wielkiego Meczetu w Mekce.</li>\r\n        <li>Półksiężyc na szczycie waży 35 ton i jest pokryty złotą mozaiką.</li>\r\n    </ul>\r\n    <figure>\r\n        <img src=\"images/The_Clock_Towers.JPG\" alt=\"Zdjęcie Abradż al-Bajt\" />\r\n        <figcaption>Abradż al-Bajt - zdjęcie pokazujące ogromną tarczę zegara</figcaption>\r\n    </figure>\r\n</section>\r\n<section class=\"intro\">\r\n    <h2>Pingan International Finance Centre</h2>\r\n    <p>Ciekawostki na temat Pingan International Finance Centre</p>\r\n    <ul>\r\n        <li>Znajduje się w Shenzhen w Chinach.</li>\r\n        <li>Ma 599 metrów wysokości, co czyni go 4. (lub 5. zależnie od rankingu) najwyższym budynku na świecie.</li>\r\n        <li>Posiada największą na świecie fasadę ze stali nierdzewnej.</li>\r\n    </ul>\r\n    <figure>\r\n        <img src=\"images/Pingan_International_Finance_Center.jpg\" alt=\"Zdjęcie Pingan International Finance Centre\" />\r\n        <figcaption>Pingan Finance Centre - widok na nowoczesną fasadę</figcaption>\r\n    </figure>\r\n</section>\r\n', 1),
(3, 'rankings', '<section>\r\n    <h2>Top 5 budynków - tabelka</h2>\r\n    <table>\r\n        <caption>Dane najwyższych budynków</caption>\r\n        <thead>\r\n            <tr><th>#</th><th>Nazwa</th><th>Kraj</th><th>Wysokość (m)</th><th>Obraz</th></tr>\r\n        </thead>\r\n        <tbody>\r\n            <tr>\r\n                <td>1</td>\r\n                <td>Burj Khalifa</td>\r\n                <td>Zjednoczone Emiraty Arabskie</td>\r\n                <td>828</td>\r\n                <td><img src=\"images/Burj_Khalifa_Mini.jpg\" alt=\"Burj Khalifa Mini\" class=\"mini-img\"></td>\r\n            </tr>\r\n            <tr>\r\n                <td>2</td>\r\n                <td>Merdeka 118</td>\r\n                <td>Malezja</td>\r\n                <td>678,9</td>\r\n                <td><img src=\"images/Merdeka_118_Mini.jpg\" alt=\"Merdeka 118 Mini\" class=\"mini-img\"></td>\r\n            </tr>\r\n            <tr>\r\n                <td>3</td>\r\n                <td>Shanghai Tower</td>\r\n                <td>Chiny</td>\r\n                <td>632</td>\r\n                <td><img src=\"images/Shanghai_Tower_Mini.jpg\" alt=\"Shanghai Tower Mini\" class=\"mini-img\"></td>\r\n            </tr>\r\n            <tr>\r\n                <td>4</td>\r\n                <td>Abradż al-Bajt</td>\r\n                <td>Arabia Saudyjska</td>\r\n                <td>601</td>\r\n                <td><img src=\"images/The_Clock_Towers_Mini.jfif\" alt=\"The Clock Towers Mini\" class=\"mini-img\"></td>\r\n            </tr>\r\n            <tr>\r\n                <td>5</td>\r\n                <td>Ping An Finance Center</td>\r\n                <td>Chiny</td>\r\n                <td>599</td>\r\n                <td><img src=\"images/Burj_Khalifa_Mini.jpg\" alt=\"Pingan Mini\" class=\"mini-img\"></td>\r\n            </tr>\r\n        </tbody>\r\n    </table>\r\n</section>', 1),
(4, 'gallery', '<section class=\"gallery\">\r\n    <figure>\r\n        <img src=\"images/Burj_Khalifa.jpg\">\r\n        <figcaption>Burj Khalifa</figcaption>\r\n    </figure>\r\n    <figure>\r\n        <img src=\"images/Burj_Khalifa_BottomView.jpg\">\r\n        <figcaption>Burj Khalifa (widok z dołu)</figcaption>\r\n    </figure>\r\n    <figure>\r\n        <img src=\"images/Merdeka_118.jpg\">\r\n        <figcaption>Merdeka 118</figcaption>\r\n    </figure>\r\n    <figure>\r\n        <img src=\"images/Shanghai_Tower.jpg\">\r\n        <figcaption>Shangai Tower</figcaption>\r\n    </figure>\r\n    <figure>\r\n        <img src=\"images/The_Clock_Towers.JPG\">\r\n        <figcaption>Abradż al-Bajt</figcaption>\r\n    </figure>\r\n    <figure>\r\n        <img src=\"images/Pingan_International_Finance_Center.jpg\">\r\n        <figcaption>Ping An Finance Center</figcaption>\r\n    </figure>\r\n    <figure>\r\n        <img src=\"images/Lotte_World_Tower.jpg\">\r\n        <figcaption>Lotte World Tower</figcaption>\r\n    </figure>\r\n</section>\r\n    \r\n</html>', 1),
(5, 'contact', '<section class=\"contact\">\r\n    <h2>Kontakt z nami</h2>\r\n    <p>Masz jakieś pytania? Napisz do nas używając formularza poniżej!</p>\r\n    <form>\r\n        <label>Imię: <br><input type=\"text\" name=\"name\"></label><br>\r\n        <label>E-mail: <br><input type=\"email\" name=\"email\"></label><br>\r\n        <label>Wiadomość: <br><textarea name=\"message\"></textarea></label><br>\r\n        <button type=\"submit\">Wyślij wiadomość</button>\r\n    </form>\r\n</section>\r\n\r\n', 1),
(6, 'jQuery', '<section>\r\n    <div id=\"animacjaTestowa1\" class=\"test-block\">Kliknij, a sie powiększe</div>\r\n        <script>\r\n            $(\"#animacjaTestowa1\").on(\"click\", function(){\r\n                $(this).animate({\r\n                    width: \"500px\",\r\n                    opacity: 0.4,\r\n                    fontsize: \"3em\",\r\n                    borderwidth: \"10px\"\r\n                }, 1500);\r\n            });\r\n        </script>\r\n    <div id=\"animacjaTestowa2\" class=\"test-block\"> Najedź kursorem, a się powiększe</div>\r\n            <script>\r\n                $(\"#animacjaTestowa2\").on({\r\n                    \"mouseover\" : function() {\r\n                        $(this).animate({ \r\n                            width: 300\r\n                        }, 800);\r\n                    },\r\n                    \"mouseout\" : function() {\r\n                        $(this).animate({\r\n                            width: 200\r\n                        }, 800);\r\n                    }\r\n                });\r\n            </script>\r\n    <div id=\"animacjaTestowa3\" class=\"test-block\"> Klikaj, abym urósł</div>\r\n        <script>\r\n            $(\"#animacjaTestowa3\").on(\"click\", function(){\r\n                if (!$(this).is(\":animated\")) {\r\n                        $(this).animate({ \r\n                        width: \"+=\" + 50,\r\n                        height: \"+=\" + 10,\r\n                        opacity: \"-=\" + 0.1,\r\n                        duration: 3000\r\n                    });\r\n                }\r\n            });\r\n        </script>\r\n</section>', 1),
(7, 'films', '<section class=\"film-section\">\r\n    <div class=\"film-item\">\r\n        <iframe width=\"600\" height=\"500\" \r\n            src=\"https://www.youtube.com/embed/RDWKwRW2Ho4\" title=\"Timelapse of Merdeka 118\" frameborder=\"0\" allowfullscreen>\r\n        </iframe>\r\n    </div>\r\n\r\n    <div class=\"film-item\">\r\n        <iframe width=\"600\" height=\"500\" \r\n            src=\"https://www.youtube.com/embed/lycTikQ59Pc\" title=\"Drone view of Shanghai tower\" frameborder=\"0\" allowfullscreen>\r\n        </iframe>\r\n    </div>\r\n\r\n    <div class=\"film-item\">\r\n        <iframe width=\"600\" height=\"500\" \r\n            src=\"https://www.youtube.com/embed/c_S0kE2XVvc\" title=\"Drone view of Burj Khalifa\" frameborder=\"0\" allowfullscreen>\r\n        </iframe>\r\n    </div>\r\n</section>\r\n\r\n<style>\r\n.film-section {\r\n    display: flex;\r\n    gap: 5px;\r\n}\r\n\r\n.film-item {\r\n    padding: 8px;\r\n    border-radius: 10px;\r\n    align-self: center;\r\n}\r\n</style>\r\n', 1);

-- --------------------------------------------------------

--
-- Table structure for table `produkty`
--

CREATE TABLE `produkty` (
  `id` int(11) NOT NULL,
  `tytul` varchar(255) NOT NULL,
  `opis` text DEFAULT NULL,
  `data_utworzenia` datetime DEFAULT current_timestamp(),
  `data_modyfikacji` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `data_wygasniecia` datetime DEFAULT NULL,
  `cena_netto` decimal(10,2) NOT NULL,
  `podatek_vat` decimal(5,2) DEFAULT 23.00,
  `ilosc_magazyn` int(11) DEFAULT 0,
  `status_dostepnosci` int(11) DEFAULT 1,
  `kategoria` int(11) DEFAULT NULL,
  `gabaryt` varchar(50) DEFAULT NULL,
  `zdjecie` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produkty`
--

INSERT INTO `produkty` (`id`, `tytul`, `opis`, `data_utworzenia`, `data_modyfikacji`, `data_wygasniecia`, `cena_netto`, `podatek_vat`, `ilosc_magazyn`, `status_dostepnosci`, `kategoria`, `gabaryt`, `zdjecie`) VALUES
(1, 'Łopata', 'Łopata MONTANA V-Plus, polska łopata wykonana z wysokogatunkowej stali, drewniany trzonek zabezpieczony lakierem.', '2026-01-10 22:16:25', '2026-01-20 23:22:07', '2030-07-30 22:25:00', 120.00, 0.00, 25, 1, 1, 'Tak', 'https://www.verkatto.pl/wp-content/uploads/2022/11/VR-7529.jpg'),
(2, 'Myszka Gamingowa dla Graczy', 'Gamingowa mysz dla graczy USB.', '2026-01-10 22:19:51', '2026-01-20 23:19:48', '2026-10-16 22:19:00', 15.00, 1.00, 9, 1, 1, 'Tak', 'https://a.allegroimg.com/original/11e804/1ca583274153b082f5501af722bd/MYSZ-MYSZKA-KOMPUTEROWA-BIUROWA-USB-DO-LAPTOPA-PC'),
(4, 'Pendrive Twister 16GB', 'Pendrive w stylu Twister o pojemności 16 GB w kolorze czarnym.', '2026-01-10 22:27:47', '2026-01-20 23:22:44', '2030-06-10 22:27:00', 18.00, 5.00, 64, 1, 1, 'Tak', 'https://gadzety24.com/galerie/p/pendrive-twister-16-gb-4_16379.jpg'),
(5, 'Koszulka', 'Koszulka w kolorze czarnym, wykonana z wysokiej jakości 100% bawełny.', '2026-01-20 23:12:56', '2026-01-20 23:15:35', '2030-01-19 23:12:00', 65.00, 10.00, 24, 1, 6, 'Tak', 'https://printgoods.pl/wp-content/uploads/2024/10/CZARNA-KOSZULKA-OVERSIZE-PRZOD.png'),
(6, 'Bluza', 'Czarna bluza z kapturem.', '2026-01-20 23:15:24', '2026-01-20 23:45:52', '2030-10-20 23:15:00', 150.00, 7.00, 100, 1, 6, 'Tak', 'https://majors.pl/userdata/public/gfx/1782/171.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kategorie`
--
ALTER TABLE `kategorie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_matka` (`matka`);

--
-- Indexes for table `page_list`
--
ALTER TABLE `page_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produkty`
--
ALTER TABLE `produkty`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategorie`
--
ALTER TABLE `kategorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `page_list`
--
ALTER TABLE `page_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `produkty`
--
ALTER TABLE `produkty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
