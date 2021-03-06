﻿<?php
/**
 * Fonctions pour l'application GSB

 * @package default
 * @author JPP
 * @version    1.0
 */

/**
 * Teste si un quelconque visiteur est connecté
 * @return vrai ou faux 
 */
function estConnecte() {
    return isset($_SESSION['idVisiteur']);
}

/**
 * Enregistre dans une variable session les infos d'un visiteur

 * @param $id 
 * @param $nom
 * @param $prenom
 */
function connecter($id, $nom, $prenom, $libelle) {
    $_SESSION['idVisiteur'] = $id;
    $_SESSION['nom'] = $nom;
    $_SESSION['prenom'] = $prenom;
    $_SESSION['libelle'] = $libelle;
}

/**
 * Détruit la session active
 */
function deconnecter() {
    session_destroy();
    header('Location: index.php');
    exit();
}

/**
 * Transforme une date au format français jj/mm/aaaa vers le format anglais aaaa-mm-jj

 * @param $madate au format  jj/mm/aaaa
 * @return la date au format anglais aaaa-mm-jj
 */
function dateFrancaisVersAnglais($maDate) {
    @list($jour, $mois, $annee) = explode('/', $maDate);
    return date('Y-m-d', mktime(0, 0, 0, $mois, $jour, $annee));
}

/**
 * Transforme une date au format format anglais aaaa-mm-jj vers le format français jj/mm/aaaa 

 * @param $madate au format  aaaa-mm-jj
 * @return la date au format format français jj/mm/aaaa
 */
function dateAnglaisVersFrancais($maDate) {
    @list($annee, $mois, $jour) = explode('-', $maDate);
    $date = "$jour" . "/" . $mois . "/" . $annee;
    return $date;
}

/**
 * retourne le mois au format aaaamm selon le jour dans le mois

 * @param $date au format  jj/mm/aaaa
 * @return le mois au format aaaamm
 */
function getMois($date) {
    @list($jour, $mois, $annee) = explode('/', $date);
    if (strlen($mois) == 1) {
        $mois = "0" . $mois;
    }
    return $annee . $mois;
}

/* gestion des erreurs */

/**
 * Indique si une valeur est un entier positif ou nul

 * @param $valeur
 * @return vrai ou faux
 */
function estEntierPositif($valeur) {
    return preg_match("/[^0-9]/", $valeur) == 0;
}

/**
 * Indique si un tableau de valeurs est constitué d'entiers positifs ou nuls

 * @param $tabEntiers : le tableau
 * @return vrai ou faux
 */
function estTableauEntiers($tabEntiers) {
    $ok = true;
    foreach ($tabEntiers as $unEntier) {
        if (!estEntierPositif($unEntier)) {
            $ok = false;
        }
    }
    return $ok;
}

/**
 * Vérifie si une date est inférieure d'un an à la date actuelle

 * @param $dateTestee 
 * @return vrai ou faux
 */
function estDateDepassee($dateTestee) {
    $dateActuelle = date("d/m/Y");
    
    
    
    @list($jour, $mois, $annee) = explode('/', $dateActuelle);
    $annee--;
    $AnPasse = $annee . $mois . $jour;
    @list($jourTeste, $moisTeste, $anneeTeste) = explode('/', $dateTestee);
    return ($anneeTeste . $moisTeste . $jourTeste < $AnPasse);
}

/**
 * Vérifie la validité du format d'une date française jj/mm/aaaa 

 * @param $date 
 * @return vrai ou faux
 */
function estDateValide($date) {
    $tabDate = explode('/', $date);
    $dateOK = true;
    if (count($tabDate) != 3) {
        $dateOK = false;
    } else {
        if (!estTableauEntiers($tabDate)) {
            $dateOK = false;
        } else {
            if (!checkdate($tabDate[1], $tabDate[0], $tabDate[2])) {
                $dateOK = false;
            }
        }
    }
    return $dateOK;
}

/**
 * Vérifie que le tableau de frais ne contient que des valeurs numériques 

 * @param $lesFrais 
 * @return vrai ou faux
 */
function lesQteFraisValides($lesFrais) {
    return estTableauEntiers($lesFrais);
}

/**
 * Vérifie la validité des trois arguments : la date, le libellé du frais et le montant 

 * des message d'erreurs sont ajoutés au tableau des erreurs

 * @param $dateFrais 
 * @param $libelle 
 * @param $montant
 */
function valideInfosFrais($dateFrais, $libelle, $montant, $smarty) {
    if ($dateFrais == "") {
        ajouterErreur("Le champ date ne doit pas être vide", $smarty);
    } else {
        if (!estDatevalide($dateFrais, $smarty)) {
            ajouterErreur("Date invalide", $smarty);
        } else {
            if (estDateDepassee($dateFrais)) {
                ajouterErreur("date d'enregistrement du frais dépassé, plus de 1 an", $smarty);
            }
        }
    }
    if ($libelle == "") {
        ajouterErreur("Le champ description ne peut pas être vide", $smarty);
    }
    if ($montant == "") {
        ajouterErreur("Le champ montant ne peut pas être vide", $smarty);
    } else
    if (!is_numeric($montant)) {
        ajouterErreur("Le champ montant doit être numérique", $smarty);
    }
}

/**
 * Ajoute le libellé d'une erreur au tableau des erreurs 

 * @param $msg : le libellé de l'erreur 
 */
function ajouterErreur($msg, &$smarty) {
    if ($smarty->tpl_vars['erreur']->value != '') {
        $smarty->tpl_vars['erreur']->value = $smarty->tpl_vars['erreur']->value . ' <br /> - ' . $msg;
    } else {
        $smarty->assign('erreur', 'Erreur : <br /> - ' . $msg);
    }
}

function smarty_function_montant($params, &$smarty) {
    $pdo = PdoGsb::getPdoGsb();
    $montant_forfait = $pdo->getLesFraisForfaitCl($params['id'], $params['mois'])[0]['montantForfait'];
    $montant_Horsforfait = $pdo->getLesFraisHorsForfaitCl($params['id'], $params['mois'])[0]['montantHorsForfait'];
    return $montant_forfait + $montant_Horsforfait;
}