ALTER TABLE visiteur RENAME personnel;

CREATE TABLE `entreprise`.`service` ( `libelle` VARCHAR(50) NOT NULL , PRIMARY KEY (`libelle`)) ENGINE = MyISAM;
INSERT INTO `service` (`libelle`) VALUES ('visiteur'), ('comptable');

ALTER TABLE `personnel` ADD `libelle` VARCHAR(50) NOT NULL AFTER `dateEmbauche`;

ALTER TABLE personnel
ADD CONSTRAINT FK_libille_personnel
FOREIGN KEY (libelle)
REFERENCES service(libelle);

UPDATE personnel SET libelle = 'visiteur';


INSERT INTO `personnel` (`id`, `nom`, `prenom`, `login`, `mdp`, `adresse`, `cp`, `ville`, `dateEmbauche`, `libelle`) 
    VALUES ('NH', 'Hernandez', 'Nicolas', 'comptable', 'comptable', '29 traverse chanteperdrix', '13010', 'marseille', '2016-03-04', 'comptable');

ALTER TABLE `lignefraishorsforfait` ADD `motifRefus` VARCHAR(250) NOT NULL AFTER `libelle`;