-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 10, 2026 at 10:38 PM
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
(1, 'glowna', '                                                                              <section class=\"intro\">\r\n    <h2>Wprowadzenie</h2>\r\n    <p>Poznaj wieżowce, które sięgają chmur! <br>W tej witrynie znajdziesz najwyższe budynki świata, galerię ze zdjęciami, oraz przeróżne ciekawostki na ich temat!</p>\r\n    <figure>\r\n        <img src=\"images/Burj_Khalifa.jpg\" alt=\"Burj Khalifa\"/>\r\n        <figcaption>Przykład gigantycznej wysokości Burj Khalify (828m)</figcaption>\r\n    </figure>\r\n</section>\r\n\r\n<section class=\"middle\">\r\n    <h2>Co znajdziesz na stronie</h2>\r\n    <ol>\r\n        <li>Opis największych budowli i ich cech</li>\r\n        <li>Rankingi wysokości (tabela) oraz przeróżne ciekawostki</li>\r\n        <li>Galeria zdjęć w różnym układzie</li>\r\n        <li>Kontakt</li>\r\n    </ol>\r\n</section>\r\n\r\n<section class=\"outro\">\r\n    <h2>Wyróżnione budynki</h2>\r\n    <article>\r\n        <h3>Burj Khalifa</h3>\r\n        <p>Najwyższy budynek świata, mający 163 piętra.<a href=\"buildings.html\"> Czytaj dalej... -></a></p>\r\n    </article>\r\n\r\n    <article>\r\n        <h3>Shanghai Tower</h3>\r\n        <p>Imponująca wieża z unikalną spiralną formą. <a href=\"buildings.html\"> Czytaj dalej... -></a></p>\r\n    </article>\r\n\r\n    <article>\r\n        <h3>The Clock Towers (Abradż al-Bajt)</h3>\r\n        <p>Kompleks hotelowy posiadający ogromny zegar na swoim szczycie. <a href=\"buildings.html\"> Czytaj dalej... -></a></p>\r\n    </article>\r\n</section>', 1),
(2, 'buildings', '<section class=\"intro\">\r\n    <h2>Burj Khalifa</h2>\r\n    <p>bla bla bla</p>\r\n    <ul>\r\n        <li>ciekawostki</li>\r\n        <li>i następna</li>\r\n    </ul>\r\n    <figure>\r\n        <img src=\"images/Burj_Khalifa_BottomView.jpg\" alt=\"Zdjęcie Burj Khalifa\" />\r\n        <figcaption>Burj Khalifa - zdjęcie podglądowe z dołu</figcaption>\r\n    </figure>\r\n</section>\r\n<section class=\"intro\">\r\n    <h2>Shanghai Tower</h2>\r\n    <p>badsfasdf</p>\r\n    <ul>\r\n        <li>to samo</li>\r\n    </ul>\r\n    <figure>\r\n        <img src=\"images/Shanghai_Tower.jpg\" alt=\"Zdjęcie Shanghai Tower\" />\r\n        <figcaption>Shanghai Tower - zdjęcie podglądowe z daleka</figcaption>\r\n    </figure>\r\n</section>\r\n<section class=\"intro\">\r\n    <h2>Merdeka 118</h2>\r\n    <p>bla bla bla</p>\r\n    <ul>\r\n        <li>ciekawostki</li>\r\n        <li>i następna</li>\r\n    </ul>\r\n    <figure>\r\n        <img src=\"images/Merdeka_118.jpg\" alt=\"Zdjęcie Merdeka 118\" />\r\n        <figcaption>Merdeka 118 - zdjęcie ukazujące unikatowy kształt budynku</figcaption>\r\n    </figure>\r\n</section>\r\n<section class=\"intro\">\r\n    <h2>The Clock Towers (Abradż al-Bajt)</h2>\r\n    <p>bla bla bla</p>\r\n    <ul>\r\n        <li>ciekawostki</li>\r\n        <li>i następna</li>\r\n    </ul>\r\n    <figure>\r\n        <img src=\"images/The_Clock_Towers.JPG\" alt=\"Zdjęcie Abradż al-Bajt\" />\r\n        <figcaption>Abradż al-Bajt - zdjęcie pokazujące ogromną tarczę zegara</figcaption>\r\n    </figure>\r\n</section>\r\n', 1),
(3, 'rankings', '<section>\r\n    <h2>Top 5 budynków - tabelka</h2>\r\n    <table>\r\n        <caption>Dane najwyższych budynków</caption>\r\n        <thead>\r\n            <tr><th>#</th><th>Nazwa</th><th>Kraj</th><th>Wysokość (m)</th><th>Obraz</th></tr>\r\n        </thead>\r\n        <tbody>\r\n            <tr>\r\n                <td>1</td>\r\n                <td>Burj Khalifa</td>\r\n                <td>Zjednoczone Emiraty Arabskie</td>\r\n                <td>828</td>\r\n                <td><img src=\"images/Burj_Khalifa_Mini.jpg\" alt=\"Burj Khalifa Mini\" class=\"mini-img\"></td>\r\n            </tr>\r\n            <tr>\r\n                <td>2</td>\r\n                <td>Merdeka 118</td>\r\n                <td>Malezja</td>\r\n                <td>678,9</td>\r\n                <td><img src=\"images/Merdeka_118_Mini.jpg\" alt=\"Merdeka 118 Mini\" class=\"mini-img\"></td>\r\n            </tr>\r\n            <tr>\r\n                <td>3</td>\r\n                <td>Shanghai Tower</td>\r\n                <td>Chiny</td>\r\n                <td>632</td>\r\n                <td><img src=\"images/Shanghai_Tower_Mini.jpg\" alt=\"Shanghai Tower Mini\" class=\"mini-img\"></td>\r\n            </tr>\r\n            <tr>\r\n                <td>4</td>\r\n                <td>Abradż al-Bajt</td>\r\n                <td>Arabia Saudyjska</td>\r\n                <td>601</td>\r\n                <td><img src=\"images/The_Clock_Towers_Mini.jfif\" alt=\"The Clock Towers Mini\" class=\"mini-img\"></td>\r\n            </tr>\r\n            <tr>\r\n                <td>5</td>\r\n                <td>Ping An Finance Center</td>\r\n                <td>Chiny</td>\r\n                <td>599</td>\r\n                <td><img src=\"images/Burj_Khalifa_Mini.jpg\" alt=\"Pingan Mini\" class=\"mini-img\"></td>\r\n            </tr>\r\n        </tbody>\r\n    </table>\r\n</section>', 1),
(4, 'gallery', '<section class=\"gallery\">\r\n    <figure>\r\n        <img src=\"images/Burj_Khalifa.jpg\">\r\n        <figcaption>Burj Khalifa</figcaption>\r\n    </figure>\r\n    <figure>\r\n        <img src=\"images/Burj_Khalifa_BottomView.jpg\">\r\n        <figcaption>Burj Khalifa (widok z dołu)</figcaption>\r\n    </figure>\r\n    <figure>\r\n        <img src=\"images/Merdeka_118.jpg\">\r\n        <figcaption>Merdeka 118</figcaption>\r\n    </figure>\r\n    <figure>\r\n        <img src=\"images/Shanghai_Tower.jpg\">\r\n        <figcaption>Shangai Tower</figcaption>\r\n    </figure>\r\n    <figure>\r\n        <img src=\"images/The_Clock_Towers.JPG\">\r\n        <figcaption>Abradż al-Bajt</figcaption>\r\n    </figure>\r\n    <figure>\r\n        <img src=\"images/Pingan_International_Finance_Center.jpg\">\r\n        <figcaption>Ping An Finance Center</figcaption>\r\n    </figure>\r\n    <figure>\r\n        <img src=\"images/Lotte_World_Tower.jpg\">\r\n        <figcaption>Lotte World Tower</figcaption>\r\n    </figure>\r\n    <figure>\r\n        <img src=\"images/\">\r\n        <figcaption>WIP</figcaption>\r\n    </figure>\r\n</section>\r\n    \r\n</html>', 1),
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
(1, 'Bombardilo', 'Jest to nasz nowy okaz bombardilo crocodilo z tego roku, świeży oraz gotowy do odebrania.', '2026-01-10 22:16:25', '2026-01-10 22:25:37', '2026-01-30 22:25:00', 67.00, 0.00, 1, 1, 1, 'Tak', 'https://i.kym-cdn.com/entries/icons/mobile/000/053/420/Bombardiro_crocodilo_cover.jpg'),
(2, 'Cappuccino Assassino', 'tak', '2026-01-10 22:19:51', '2026-01-10 22:24:56', '2026-01-30 22:19:00', 69.00, 5.00, 0, 1, 2, 'Tak', 'https://imgs.search.brave.com/7XLOAZxJi3o6V010_GYF01b6qBS1Hzoc1cPMGyjq3_Q/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9paDEu/cmVkYnViYmxlLm5l/dC9pbWFnZS41ODA0/MzI2OTE0LjM5MDMv/cmFmLDM2MHgzNjAs/MDc1LHQsZmFmYWZh/OmNhNDQzZjQ3ODYu/anBn'),
(4, 'fhgfhghgf', 'fghfghfgh', '2026-01-10 22:27:47', '2026-01-10 22:30:29', '2026-01-10 22:27:00', 64.00, 5.00, 3, 1, 5, 'Tak', '');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `produkty`
--
ALTER TABLE `produkty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
