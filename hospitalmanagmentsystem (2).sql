-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 15, 2023 at 05:43 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospitalmanagmentsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `dijagnoza`
--

CREATE TABLE `dijagnoza` (
  `id_dijagnoze` int(11) NOT NULL,
  `naziv` varchar(50) NOT NULL,
  `misljenje` varchar(300) NOT NULL,
  `pregled_id_pregleda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dijagnoza`
--

INSERT INTO `dijagnoza` (`id_dijagnoze`, `naziv`, `misljenje`, `pregled_id_pregleda`) VALUES
(5, 'Jaka bolestina', 'Nije dobro', 5),
(6, 'Hmm', 'Nije dobro ja msm', 2),
(7, 'Coronavirus', 'Ostati kuci', 3),
(8, 'Migrena', 'Tak tak. ', 9),
(9, 'Asdasd', 'Asdasd', 7);

-- --------------------------------------------------------

--
-- Table structure for table `lijecnik`
--

CREATE TABLE `lijecnik` (
  `id_lijecnika` int(11) NOT NULL,
  `ime` varchar(50) NOT NULL,
  `prezime` varchar(50) NOT NULL,
  `kontakt_broj` varchar(50) NOT NULL,
  `kontakt_mail` varchar(50) DEFAULT NULL,
  `placa` int(11) NOT NULL,
  `Smjena_id_smjene` int(11) NOT NULL,
  `Specijalizacija_id_specijalizacije` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lijecnik`
--

INSERT INTO `lijecnik` (`id_lijecnika`, `ime`, `prezime`, `kontakt_broj`, `kontakt_mail`, `placa`, `Smjena_id_smjene`, `Specijalizacija_id_specijalizacije`) VALUES
(1, 'Matija', 'Krajić', '0921635850 ', 'mkrajic@gmail.com', 8000, 1, 10),
(2, 'Karlo', 'Bajić', '0934742606', 'karlo.bajic@hotmail.com', 9200, 2, 10),
(3, 'Robert', 'Knežić', '0983193649 ', 'robert.knezic12@gmail.com', 12000, 3, 2),
(4, 'Boris', 'Grgić', '0991895069', 'bgrgicc22@gmail.com', 9000, 1, 12),
(5, 'Pero', 'Erlić', '0922865078', 'pero.erlic@gmail.com', 13000, 2, 11);

-- --------------------------------------------------------

--
-- Table structure for table `lijek`
--

CREATE TABLE `lijek` (
  `id_lijeka` int(11) NOT NULL,
  `naziv` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lijek`
--

INSERT INTO `lijek` (`id_lijeka`, `naziv`) VALUES
(1, 'Aspirin '),
(2, 'Paracetamol '),
(3, 'Ibuprofen '),
(4, 'Penicillin '),
(5, 'Amoxicillin '),
(6, 'Insulin '),
(7, 'Lipitor'),
(8, 'Advair '),
(9, 'Nexium '),
(10, 'Viagra '),
(11, 'Paracetamol '),
(12, 'Oxycodone '),
(13, 'Tylenol '),
(14, 'Zantac '),
(15, 'Prozac '),
(16, 'Lexapro '),
(17, 'Xanax '),
(18, 'Adderall'),
(19, 'Plavix'),
(20, 'Tamiflu '),
(21, 'Zithromax '),
(22, 'Ritalin ');

-- --------------------------------------------------------

--
-- Table structure for table `lijek_has_dijagnoza`
--

CREATE TABLE `lijek_has_dijagnoza` (
  `Lijek_id_lijeka` int(11) NOT NULL,
  `Dijagnoza_id_dijagnoze` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lijek_has_dijagnoza`
--

INSERT INTO `lijek_has_dijagnoza` (`Lijek_id_lijeka`, `Dijagnoza_id_dijagnoze`) VALUES
(1, 5),
(1, 7),
(2, 5),
(3, 5),
(3, 7),
(3, 8),
(4, 6),
(4, 9),
(16, 6);

-- --------------------------------------------------------

--
-- Table structure for table `medicinska_sestra`
--

CREATE TABLE `medicinska_sestra` (
  `id_mecinske_sestre` int(11) NOT NULL,
  `ime` varchar(50) NOT NULL,
  `prezime` varchar(50) NOT NULL,
  `placa` double NOT NULL,
  `datum_zaposlavanja` date DEFAULT NULL,
  `broj_licence` int(11) NOT NULL,
  `kontakt_mail` varchar(50) NOT NULL,
  `kontakt_broj` varchar(50) NOT NULL,
  `Pozicija_ms_id_pozicije_ms` int(11) NOT NULL,
  `Specijalizacija_id_specijalizacije` int(11) NOT NULL,
  `Smjena_id_smjene` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `medicinska_sestra`
--

INSERT INTO `medicinska_sestra` (`id_mecinske_sestre`, `ime`, `prezime`, `placa`, `datum_zaposlavanja`, `broj_licence`, `kontakt_mail`, `kontakt_broj`, `Pozicija_ms_id_pozicije_ms`, `Specijalizacija_id_specijalizacije`, `Smjena_id_smjene`) VALUES
(1, 'Marina', 'Mamić', 8000, '2019-06-12', 45491560, 'mmamic@gmail.com', '09970750343', 1, 3, 1),
(2, 'Barica ', 'Katić', 9000, '2019-06-25', 54596060, 'bkatic@gmail.com', '09812746813', 3, 3, 2),
(3, 'Franka', 'Pačić', 8550, '2020-01-10', 72590418, 'fpavic2@gmail.com', '09759825741', 2, 2, 1),
(4, 'Dubravka', 'Kosić', 7600, '2021-03-30', 69344016, 'dubravkakosic@gmail.com', '09991316026', 3, 2, 1),
(5, 'Lana', 'Gubica', 8000, '2021-05-05', 30476050, 'lana_gubica2@gmail.com', '09896896474', 3, 4, 2),
(6, 'Marina', 'Kovač', 9000, '2022-02-01', 61335969, 'mkovac@gmail.com', '09175628799', 3, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `medicinska_sestra_has_soba`
--

CREATE TABLE `medicinska_sestra_has_soba` (
  `Medicinska_sestra_id_mecinske_sestre` int(11) NOT NULL,
  `Soba_id_sobe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `medicinska_sestra_has_soba`
--

INSERT INTO `medicinska_sestra_has_soba` (`Medicinska_sestra_id_mecinske_sestre`, `Soba_id_sobe`) VALUES
(3, 2),
(4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `pacijent`
--

CREATE TABLE `pacijent` (
  `id_pacijenta` int(11) NOT NULL,
  `ime` varchar(50) NOT NULL,
  `prezime` varchar(50) NOT NULL,
  `datum_rodjenja` date NOT NULL,
  `adresa` varchar(100) NOT NULL,
  `kontakt_broj` varchar(50) NOT NULL,
  `kontakt_mail` varchar(50) NOT NULL,
  `Soba_id_sobe` int(11) NOT NULL,
  `Spol_id_spola` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pacijent`
--

INSERT INTO `pacijent` (`id_pacijenta`, `ime`, `prezime`, `datum_rodjenja`, `adresa`, `kontakt_broj`, `kontakt_mail`, `Soba_id_sobe`, `Spol_id_spola`) VALUES
(5, 'Petar', 'Đurić', '1965-02-05', 'Ulica Frana Supila 3', '0985209389', 'pduric@gmail.com', 5, 1),
(7, 'Ljubica', 'Majstorović', '1972-05-11', 'Ulica Josipa Kozarca 7', '0954397622 ', 'ljubicamajstor@hotmail.com', 2, 2),
(9, 'Josip', 'Brane', '2022-12-01', 'Filipa Kresimira 12', '0987289343', 'josipbrane@gmail.com', 1, 1),
(13, 'Nikola', 'Božić', '2000-12-16', 'Negdje daleko 12', '0995674562', 'nikolaboz@gmail.com', 4, 1),
(15, 'Krunoslav', 'Bosnić', '1998-02-01', 'Ulica Palih Boraca 12', '0997892345', 'kbozic@gmail.com', 4, 1),
(19, 'Josip', 'Banic', '2023-01-19', 'Adresa', '12312312312', 'email', 2, 1),
(20, 'Jakov', 'Javor', '1997-01-25', 'Trg Kralja Zvonimira 22', '0985554442', 'jakov.javor@gmail.com', 4, 1);

--
-- Triggers `pacijent`
--
DELIMITER $$
CREATE TRIGGER `audit_pacijent_delete_trigger` AFTER DELETE ON `pacijent` FOR EACH ROW BEGIN 
    INSERT INTO pacijent_audit_log(`id_pacijenta`, `ime`, `prezime`, `datum_rodjenja`, `adresa`, `kontakt_broj`, `kontakt_mail`, `Soba_id_sobe`, `Spol_id_spola`, `akcija`, `datum_akcije`) 
    VALUES (OLD.id_pacijenta, OLD.ime, OLD.prezime, OLD.datum_rodjenja, OLD.adresa, OLD.kontakt_broj, OLD.kontakt_mail, OLD.Soba_id_sobe, OLD.Spol_id_spola, "DELETE", NOW()); 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `audit_pacijent_insert_trigger` AFTER INSERT ON `pacijent` FOR EACH ROW BEGIN
    INSERT INTO pacijent_audit_log(`id_pacijenta`, `ime`, `prezime`, `datum_rodjenja`, `adresa`, `kontakt_broj`, `kontakt_mail`, `Soba_id_sobe`, `Spol_id_spola`, `akcija`, `datum_akcije`)
    VALUES (NEW.id_pacijenta, NEW.ime, NEW.prezime, NEW.datum_rodjenja, NEW.adresa, NEW.kontakt_broj, NEW.kontakt_mail, NEW.Soba_id_sobe, NEW.Spol_id_spola, "UPDATE", NOW());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `audit_pacijent_update_trigger` AFTER UPDATE ON `pacijent` FOR EACH ROW BEGIN
    INSERT INTO pacijent_audit_log(`id_pacijenta`, `ime`, `prezime`, `datum_rodjenja`, `adresa`, `kontakt_broj`, `kontakt_mail`, `Soba_id_sobe`, `Spol_id_spola`, `akcija`, `datum_akcije`)
    VALUES (NEW.id_pacijenta, NEW.ime, NEW.prezime, NEW.datum_rodjenja, NEW.adresa, NEW.kontakt_broj, NEW.kontakt_mail, NEW.Soba_id_sobe, NEW.Spol_id_spola, "UPDATE", NOW());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `pacijent_audit_log`
--

CREATE TABLE `pacijent_audit_log` (
  `id_pacijenta` int(11) NOT NULL,
  `ime` varchar(50) NOT NULL,
  `prezime` varchar(50) NOT NULL,
  `datum_rodjenja` date NOT NULL,
  `adresa` varchar(50) NOT NULL,
  `kontakt_broj` varchar(30) NOT NULL,
  `kontakt_mail` varchar(30) NOT NULL,
  `Soba_id_sobe` int(11) NOT NULL,
  `Spol_id_spola` int(11) NOT NULL,
  `akcija` varchar(50) NOT NULL,
  `datum_akcije` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pacijent_audit_log`
--

INSERT INTO `pacijent_audit_log` (`id_pacijenta`, `ime`, `prezime`, `datum_rodjenja`, `adresa`, `kontakt_broj`, `kontakt_mail`, `Soba_id_sobe`, `Spol_id_spola`, `akcija`, `datum_akcije`) VALUES
(18, 'Ivo', 'Kirina', '2000-01-12', 'Tamo tamo daleko 27', '099655228863', 'ivokirina@gmail.com', 2, 1, 'insert', '2023-01-14'),
(18, 'Ivo', 'Kirina', '2000-01-12', 'Tamo tamo daleko 27', '099655228863', 'ivokirina@gmail.com', 2, 1, 'DELETE', '2023-01-14'),
(15, 'Krunoslav', 'Bosnić', '1998-02-01', 'Ulica Palih Boraca 12', '0997892345', 'kbozic@gmail.com', 4, 1, 'UPDATE', '2023-01-14'),
(7, 'Ljubica', 'Majstorović', '1972-05-11', 'Ulica Josipa Kozarca 7', '0954397622 ', 'ljubicamajstor@hotmail.com', 2, 2, 'UPDATE', '2023-01-14'),
(19, 'Josip', 'Banic', '2023-01-19', 'Adresa', '12312312312', 'email', 2, 1, 'UPDATE', '2023-01-14'),
(20, 'Jakov', 'Javor', '1997-01-25', 'Trg Kralja Zvonimira 22', '0985554442', 'jakov.javor@gmail.com', 4, 1, 'UPDATE', '2023-01-15');

-- --------------------------------------------------------

--
-- Table structure for table `pozicija_ms`
--

CREATE TABLE `pozicija_ms` (
  `id_pozicije_ms` int(11) NOT NULL,
  `naziv` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pozicija_ms`
--

INSERT INTO `pozicija_ms` (`id_pozicije_ms`, `naziv`) VALUES
(1, 'Glavna medicinska sestra'),
(2, 'Medinska sestra na praksi'),
(3, 'Registrirana medicinska sestra');

-- --------------------------------------------------------

--
-- Table structure for table `pregled`
--

CREATE TABLE `pregled` (
  `id_pregleda` int(11) NOT NULL,
  `datum_termina_pregleda` date NOT NULL,
  `Status_pregleda_id_statusa_pregleda` int(11) NOT NULL,
  `Lijecnik_lijecnik_id` int(11) NOT NULL,
  `pacijent_id_pacijenta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pregled`
--

INSERT INTO `pregled` (`id_pregleda`, `datum_termina_pregleda`, `Status_pregleda_id_statusa_pregleda`, `Lijecnik_lijecnik_id`, `pacijent_id_pacijenta`) VALUES
(2, '2023-01-02', 1, 2, 5),
(3, '2022-12-09', 1, 1, 9),
(5, '2023-01-13', 1, 1, 9),
(7, '2023-01-18', 1, 1, 5),
(8, '2023-01-19', 2, 2, 15),
(9, '2023-01-14', 1, 4, 7),
(10, '2023-01-19', 2, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `simptom`
--

CREATE TABLE `simptom` (
  `id_simptoma` int(11) NOT NULL,
  `naziv` varchar(50) NOT NULL,
  `opis` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `simptom`
--

INSERT INTO `simptom` (`id_simptoma`, `naziv`, `opis`) VALUES
(1, 'Bol u tijelu', 'Bol i ukočenost (fibromialgija) mogu se javiti u cijelom tijelu ili mogu biti ograničeni na određeno'),
(2, 'Vrtoglavica', 'Vrtoglavica (vertigo) je tek simptom koji upućuje na poremećaj funkcije centra za ravnotežu'),
(3, 'Glavobolja', 'Glavobolja se često javlja kao simptom koji otežava ili onesposobljava bolesnika, no rijetko se radi o životnoj ugroženosti.'),
(4, 'Anksioznost', 'Tjeskoba (anksioznost) tj. tjeskobnost je stanje koje se očituje osjećajem tjeskobe, ustrašenosti, straha sve do panike, uz psihomotornu (tjelesna) napetost i unutrašnji nemir'),
(5, 'Depresija ', 'Depresija je vrlo učestala bolest, koju je vrlo važno znati prepoznati i suočiti se s njom. Osnovne karakteristike ove bolesti su sniženo, bezvoljno raspoloženje, žalost i beznađe, gubitak osjećaja za'),
(6, 'Groznica', 'Groznica, poznatija i kao vrućica, febrilno stanje ili pireksija, stanje je povišene temperature u ljudskom tijelu iznad normalne razine.'),
(7, 'Zimica', 'Napadaje zimice ili drhtavice prati blijedilo i osjećaj hladnoće, često kao posljedica vrućice ili početka bolesti. '),
(8, 'Gubitak težine', NULL),
(9, 'Kašalj', 'Kašalj (lat. tussis) predstavlja automatski, prirodni refleks (bez čovjekove volje) koji pomaže da se iz dišnih putova izbace sekret, razni iritansi, strane čestice i mikroorganizmi.'),
(10, 'Povišena temperatura', 'To je stanje organizma u kojem se centar za temperaturu u središnjem dijelu mozga namjesti na temperaturu višu od uobičajene zbog poremećaja termoregulacije, nerazmjera između povećanog stvaranja tjelesne temperature i njezina smanjenog otpuštanja.'),
(11, 'Umor', 'Umor je čest simptom brojnih bolesti, to jest stanje u kojem se cijelo vrijeme osjećate iscrpljeno, bez energije, čak i nakon što se dobro odmorite, što neminovno utječe na svakodnevno funkcioniranje te mentalno i emocionalno stanje.\n'),
(12, 'Poteškoće s disanjem', 'Poteškoće u disanju mogu biti uzrokovane mnogim različitim stanjima. Oni se također mogu razviti kao rezultat stresa i anksioznosti.'),
(13, 'Problemi sa gutanjem', 'Disfagija je medicinski pojam koji označava poteškoće s gutanjem, odnosno otežano gutanje hrane ili tekućine. Gutanje može biti i bolno, a u nekim slučajevima čak i nemoguće.\n'),
(14, 'Gubitak okusa', NULL),
(15, 'Gubitak mirisa', NULL),
(16, 'Hripavost', 'Hrípavost ali disfoníja pomeni nejasen, nečist glas. Lahko je posledica vnetja grla (na primer zaradi okužbe zgornjih dihal ali alergije),'),
(17, 'Povraćanje ', 'Povraćanje je snažna kontrakcija želuca koja pokreće želučani sadržaj u jednjak i izlazi iz usta. (Vidi također Povraćanje u dojenčadi i djece.) Povraćanjem se isprazni želudac i često se ljudi s osjećaju znatno bolje, barem privremeno. Povraćanje je prilično neugodno i može biti neugodno'),
(18, 'Proljev', 'Proljev predstavlja povećanje obujma i sadržaja ili učestalosti pražnjenja crijeva. Vrlo je često samo simptom neke ozbiljnije bolesti i bolesnog stanja (Crohnova bolest, ulcerozni kolitis, crijevna zarazne bolest), a ponekad je ipak samo privremeni problem.');

-- --------------------------------------------------------

--
-- Table structure for table `simptom_has_pregled`
--

CREATE TABLE `simptom_has_pregled` (
  `Simptom_id_simptoma` int(11) NOT NULL,
  `Pregled_id_pregleda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `simptom_has_pregled`
--

INSERT INTO `simptom_has_pregled` (`Simptom_id_simptoma`, `Pregled_id_pregleda`) VALUES
(2, 2),
(2, 5),
(2, 7),
(3, 5),
(3, 9),
(4, 2),
(4, 5),
(14, 3),
(15, 3);

-- --------------------------------------------------------

--
-- Table structure for table `smjena`
--

CREATE TABLE `smjena` (
  `id_smjene` int(11) NOT NULL,
  `naziv` varchar(50) NOT NULL,
  `pocetak_smjene` time NOT NULL,
  `kraj_smjene` time NOT NULL,
  `pocetak_pauze` time NOT NULL,
  `kraj_pauze` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `smjena`
--

INSERT INTO `smjena` (`id_smjene`, `naziv`, `pocetak_smjene`, `kraj_smjene`, `pocetak_pauze`, `kraj_pauze`) VALUES
(1, 'Jutarnja', '08:00:00', '16:00:00', '11:30:00', '12:00:00'),
(2, 'Popodnevna', '16:00:00', '00:00:00', '19:30:00', '20:00:00'),
(3, 'Noćna', '00:00:00', '08:00:00', '03:30:00', '04:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `soba`
--

CREATE TABLE `soba` (
  `id_sobe` int(11) NOT NULL,
  `kat` int(11) NOT NULL,
  `kapacitet` int(11) NOT NULL,
  `opis` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `soba`
--

INSERT INTO `soba` (`id_sobe`, `kat`, `kapacitet`, `opis`) VALUES
(1, 1, 4, NULL),
(2, 1, 5, NULL),
(3, 1, 4, NULL),
(4, 1, 5, NULL),
(5, 1, 4, NULL),
(6, 1, 5, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `specijalizacija`
--

CREATE TABLE `specijalizacija` (
  `id_specijalizacije` int(11) NOT NULL,
  `naziv` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `specijalizacija`
--

INSERT INTO `specijalizacija` (`id_specijalizacije`, `naziv`) VALUES
(1, 'Intenzivna njega'),
(2, 'Pedijatrija'),
(3, 'Briga za starije'),
(4, 'Briga za osobe sa rakom'),
(5, 'Ginekologija'),
(6, 'Hitna medicina'),
(7, 'Dermatologija'),
(8, 'Epidemiologija'),
(9, 'Kardiologija'),
(10, 'Opća medicina'),
(11, 'Plastična kirurgija'),
(12, 'Neurologija'),
(13, 'Psihijatrija'),
(14, 'Urologija');

-- --------------------------------------------------------

--
-- Table structure for table `spol`
--

CREATE TABLE `spol` (
  `id_spola` int(11) NOT NULL,
  `naziv` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `spol`
--

INSERT INTO `spol` (`id_spola`, `naziv`) VALUES
(1, 'M'),
(2, 'Ž');

-- --------------------------------------------------------

--
-- Table structure for table `status_pregleda`
--

CREATE TABLE `status_pregleda` (
  `id_statusa_pregleda` int(11) NOT NULL,
  `naziv` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `status_pregleda`
--

INSERT INTO `status_pregleda` (`id_statusa_pregleda`, `naziv`) VALUES
(1, 'Obavljen'),
(2, 'Ne obavljen');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dijagnoza`
--
ALTER TABLE `dijagnoza`
  ADD PRIMARY KEY (`id_dijagnoze`),
  ADD KEY `fk_dijagnoza_pregled` (`pregled_id_pregleda`);

--
-- Indexes for table `lijecnik`
--
ALTER TABLE `lijecnik`
  ADD PRIMARY KEY (`id_lijecnika`),
  ADD KEY `fk_Lijecnik_Smjena1_idx` (`Smjena_id_smjene`),
  ADD KEY `fk_Lijecnik_Specijalizacija1_idx` (`Specijalizacija_id_specijalizacije`);

--
-- Indexes for table `lijek`
--
ALTER TABLE `lijek`
  ADD PRIMARY KEY (`id_lijeka`);

--
-- Indexes for table `lijek_has_dijagnoza`
--
ALTER TABLE `lijek_has_dijagnoza`
  ADD PRIMARY KEY (`Lijek_id_lijeka`,`Dijagnoza_id_dijagnoze`),
  ADD KEY `fk_Lijek_has_Dijagnoza_Dijagnoza1_idx` (`Dijagnoza_id_dijagnoze`),
  ADD KEY `fk_Lijek_has_Dijagnoza_Lijek1_idx` (`Lijek_id_lijeka`);

--
-- Indexes for table `medicinska_sestra`
--
ALTER TABLE `medicinska_sestra`
  ADD PRIMARY KEY (`id_mecinske_sestre`),
  ADD KEY `fk_Medicinska_sestra_Pozicija_ms1_idx` (`Pozicija_ms_id_pozicije_ms`),
  ADD KEY `fk_Medicinska_sestra_Specijalizacija1_idx` (`Specijalizacija_id_specijalizacije`),
  ADD KEY `fk_Medicinska_sestra_Smjena1_idx` (`Smjena_id_smjene`);

--
-- Indexes for table `medicinska_sestra_has_soba`
--
ALTER TABLE `medicinska_sestra_has_soba`
  ADD PRIMARY KEY (`Medicinska_sestra_id_mecinske_sestre`,`Soba_id_sobe`),
  ADD KEY `fk_Medicinska_sestra_has_Soba_Soba1_idx` (`Soba_id_sobe`),
  ADD KEY `fk_Medicinska_sestra_has_Soba_Medicinska_sestra1_idx` (`Medicinska_sestra_id_mecinske_sestre`);

--
-- Indexes for table `pacijent`
--
ALTER TABLE `pacijent`
  ADD PRIMARY KEY (`id_pacijenta`),
  ADD KEY `fk_Pacijent_Soba1_idx` (`Soba_id_sobe`),
  ADD KEY `fk_Pacijent_Spol1_idx` (`Spol_id_spola`);

--
-- Indexes for table `pacijent_audit_log`
--
ALTER TABLE `pacijent_audit_log`
  ADD KEY `fk_Pacijent_Soba_log` (`Soba_id_sobe`),
  ADD KEY `fk_Pacijent_Spol_log` (`Spol_id_spola`);

--
-- Indexes for table `pozicija_ms`
--
ALTER TABLE `pozicija_ms`
  ADD PRIMARY KEY (`id_pozicije_ms`);

--
-- Indexes for table `pregled`
--
ALTER TABLE `pregled`
  ADD PRIMARY KEY (`id_pregleda`),
  ADD KEY `fk_Pregled_Status_pregleda1_idx` (`Status_pregleda_id_statusa_pregleda`),
  ADD KEY `fk_pregled_lijecnik` (`Lijecnik_lijecnik_id`),
  ADD KEY `fk_pregled_pacijent` (`pacijent_id_pacijenta`);

--
-- Indexes for table `simptom`
--
ALTER TABLE `simptom`
  ADD PRIMARY KEY (`id_simptoma`);

--
-- Indexes for table `simptom_has_pregled`
--
ALTER TABLE `simptom_has_pregled`
  ADD PRIMARY KEY (`Simptom_id_simptoma`,`Pregled_id_pregleda`),
  ADD KEY `fk_Simptom_has_Pregled_Pregled1_idx` (`Pregled_id_pregleda`),
  ADD KEY `fk_Simptom_has_Pregled_Simptom1_idx` (`Simptom_id_simptoma`);

--
-- Indexes for table `smjena`
--
ALTER TABLE `smjena`
  ADD PRIMARY KEY (`id_smjene`);

--
-- Indexes for table `soba`
--
ALTER TABLE `soba`
  ADD PRIMARY KEY (`id_sobe`);

--
-- Indexes for table `specijalizacija`
--
ALTER TABLE `specijalizacija`
  ADD PRIMARY KEY (`id_specijalizacije`);

--
-- Indexes for table `spol`
--
ALTER TABLE `spol`
  ADD PRIMARY KEY (`id_spola`);

--
-- Indexes for table `status_pregleda`
--
ALTER TABLE `status_pregleda`
  ADD PRIMARY KEY (`id_statusa_pregleda`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dijagnoza`
--
ALTER TABLE `dijagnoza`
  MODIFY `id_dijagnoze` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `lijecnik`
--
ALTER TABLE `lijecnik`
  MODIFY `id_lijecnika` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `lijek`
--
ALTER TABLE `lijek`
  MODIFY `id_lijeka` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `medicinska_sestra`
--
ALTER TABLE `medicinska_sestra`
  MODIFY `id_mecinske_sestre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pacijent`
--
ALTER TABLE `pacijent`
  MODIFY `id_pacijenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `pozicija_ms`
--
ALTER TABLE `pozicija_ms`
  MODIFY `id_pozicije_ms` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pregled`
--
ALTER TABLE `pregled`
  MODIFY `id_pregleda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `simptom`
--
ALTER TABLE `simptom`
  MODIFY `id_simptoma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `smjena`
--
ALTER TABLE `smjena`
  MODIFY `id_smjene` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `soba`
--
ALTER TABLE `soba`
  MODIFY `id_sobe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `specijalizacija`
--
ALTER TABLE `specijalizacija`
  MODIFY `id_specijalizacije` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `spol`
--
ALTER TABLE `spol`
  MODIFY `id_spola` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `status_pregleda`
--
ALTER TABLE `status_pregleda`
  MODIFY `id_statusa_pregleda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dijagnoza`
--
ALTER TABLE `dijagnoza`
  ADD CONSTRAINT `dijagnoza_ibfk_1` FOREIGN KEY (`pregled_id_pregleda`) REFERENCES `pregled` (`id_pregleda`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_dijagnoza_pregled` FOREIGN KEY (`pregled_id_pregleda`) REFERENCES `pregled` (`id_pregleda`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `lijecnik`
--
ALTER TABLE `lijecnik`
  ADD CONSTRAINT `fk_Lijecnik_Smjena` FOREIGN KEY (`Smjena_id_smjene`) REFERENCES `smjena` (`id_smjene`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Lijecnik_Specijalizacija` FOREIGN KEY (`Specijalizacija_id_specijalizacije`) REFERENCES `specijalizacija` (`id_specijalizacije`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `lijek_has_dijagnoza`
--
ALTER TABLE `lijek_has_dijagnoza`
  ADD CONSTRAINT `fk_Lijek_has_Dijagnoza_Dijagnoza` FOREIGN KEY (`Dijagnoza_id_dijagnoze`) REFERENCES `dijagnoza` (`id_dijagnoze`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Lijek_has_Dijagnoza_Lijek` FOREIGN KEY (`Lijek_id_lijeka`) REFERENCES `lijek` (`id_lijeka`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `medicinska_sestra`
--
ALTER TABLE `medicinska_sestra`
  ADD CONSTRAINT `fk_Medicinska_sestra_Pozicija_ms` FOREIGN KEY (`Pozicija_ms_id_pozicije_ms`) REFERENCES `pozicija_ms` (`id_pozicije_ms`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Medicinska_sestra_Smjena` FOREIGN KEY (`Smjena_id_smjene`) REFERENCES `smjena` (`id_smjene`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Medicinska_sestra_Specijalizacija` FOREIGN KEY (`Specijalizacija_id_specijalizacije`) REFERENCES `specijalizacija` (`id_specijalizacije`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `medicinska_sestra_has_soba`
--
ALTER TABLE `medicinska_sestra_has_soba`
  ADD CONSTRAINT `fk_Medicinska_sestra_has_Soba_Medicinska_sestra` FOREIGN KEY (`Medicinska_sestra_id_mecinske_sestre`) REFERENCES `medicinska_sestra` (`id_mecinske_sestre`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Medicinska_sestra_has_Soba_Soba` FOREIGN KEY (`Soba_id_sobe`) REFERENCES `soba` (`id_sobe`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `pacijent`
--
ALTER TABLE `pacijent`
  ADD CONSTRAINT `fk_Pacijent_Soba` FOREIGN KEY (`Soba_id_sobe`) REFERENCES `soba` (`id_sobe`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Pacijent_Spol` FOREIGN KEY (`Spol_id_spola`) REFERENCES `spol` (`id_spola`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `pacijent_audit_log`
--
ALTER TABLE `pacijent_audit_log`
  ADD CONSTRAINT `fk_Pacijent_Soba_log` FOREIGN KEY (`Soba_id_sobe`) REFERENCES `soba` (`id_sobe`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Pacijent_Spol_log` FOREIGN KEY (`Spol_id_spola`) REFERENCES `spol` (`id_spola`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `pregled`
--
ALTER TABLE `pregled`
  ADD CONSTRAINT `fk_Pregled_Status_pregleda` FOREIGN KEY (`Status_pregleda_id_statusa_pregleda`) REFERENCES `status_pregleda` (`id_statusa_pregleda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pregled_lijecnik` FOREIGN KEY (`Lijecnik_lijecnik_id`) REFERENCES `lijecnik` (`id_lijecnika`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pregled_pacijent` FOREIGN KEY (`pacijent_id_pacijenta`) REFERENCES `pacijent` (`id_pacijenta`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `pregled_ibfk_1` FOREIGN KEY (`Lijecnik_lijecnik_id`) REFERENCES `lijecnik` (`id_lijecnika`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `pregled_ibfk_2` FOREIGN KEY (`pacijent_id_pacijenta`) REFERENCES `pacijent` (`id_pacijenta`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `simptom_has_pregled`
--
ALTER TABLE `simptom_has_pregled`
  ADD CONSTRAINT `fk_Simptom_has_Pregled_Pregled` FOREIGN KEY (`Pregled_id_pregleda`) REFERENCES `pregled` (`id_pregleda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Simptom_has_Pregled_Simptom` FOREIGN KEY (`Simptom_id_simptoma`) REFERENCES `simptom` (`id_simptoma`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
