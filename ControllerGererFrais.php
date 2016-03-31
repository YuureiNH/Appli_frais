<?php

require './launcher.php';

$idVisiteur = $_SESSION['idVisiteur'];
$mois = getMois(date("d/m/Y"));
//$mois = '201602'; 

$numAnnee = substr($mois, 0, 4);
$numMois = substr($mois, 4, 2);
$smarty->assign('numAnnee', $numAnnee);
$smarty->assign('numMois', $numMois);

$action = $_REQUEST['action'];
switch ($action) {
    case 'saisirFrais': {
            if ($pdo->estPremierFraisMois($idVisiteur, $mois)) {
                $pdo->creeNouvellesLignesFrais($idVisiteur, $mois);
            }
            break;
        }
    case 'validerMajFraisForfait': {
            $lesFrais = $_REQUEST['lesFrais'];
            if (lesQteFraisValides($lesFrais)) {
                $pdo->majFraisForfait($idVisiteur, $mois, $lesFrais);
            } else {
                ajouterErreur("Les valeurs des frais doivent être numériques", $smarty);
            }
            break;
        }
    case 'validerCreationFrais': {
            $dateFrais = $_REQUEST['dateFrais'];
            $libelle = $_REQUEST['libelle'];
            $montant = $_REQUEST['montant'];
            valideInfosFrais($dateFrais, $libelle, $montant, $smarty);
            if ($smarty->tpl_vars['erreur']->value == '') {
                $pdo->creeNouveauFraisHorsForfait($idVisiteur, $mois, $libelle, $dateFrais, $montant);
            }
            break;
        }
    case 'supprimerFrais': {
            $idFrais = $_REQUEST['idFrais'];
            $pdo->supprimerFraisHorsForfait($idFrais);
            break;
        }
    case 'refuserFrais': {
            $idFrais = $_REQUEST['idFrais'];
            $motif = $_REQUEST['text'];
            $pdo->refusFraisHorsForfait($idFrais, $motif);
            break;
        }
    case 'deporterHorfait': {
            $idFrais = $_REQUEST['idFrais'];
            $idVisiteur = $_REQUEST['idVisiteur'];
            $pdo->deporterHorfait($idFrais, $idVisiteur);
            break;
        }
}
$lesFraisHorsForfait = $pdo->getLesFraisHorsForfait($idVisiteur, $mois);
$lesFraisForfait = $pdo->getLesFraisForfait($idVisiteur, $mois);

$smarty->assign('lesFraisForfait', $lesFraisForfait);
$smarty->assign('lesFraisHorsForfait', $lesFraisHorsForfait);

$smarty->display('compte.tpl');
