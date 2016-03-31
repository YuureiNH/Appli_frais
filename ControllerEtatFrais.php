<?php
require ('/launcher.php');

$action = $_REQUEST['action'];
$idVisiteur = $_SESSION['idVisiteur'];

switch ($action) {
    case 'selectionnerMois': {
            $lesMois = $pdo->getLesMoisDisponibles($idVisiteur);
            // Afin de sélectionner par défaut le dernier mois dans la zone de liste
            // on demande toutes les clés, et on prend la première,
            // les mois étant triés décroissants
            $lesCles = array_keys($lesMois);
            $moisASelectionner = $lesCles[0];
            $smarty->assign('lesMois', $lesMois);
            $smarty->assign('moisASelectionner', $moisASelectionner);
            $smarty->display('compte.tpl');
            break;
        }
    case 'voirEtatFrais': {
            $leMois = $_REQUEST['lstMois'];
            $lesMois = $pdo->getLesMoisDisponibles($idVisiteur);
            $moisASelectionner = $leMois;
            $smarty->assign('lesMois', $lesMois);
            $smarty->assign('moisASelectionner', $moisASelectionner);

            $lesFraisHorsForfait = $pdo->getLesFraisHorsForfait($idVisiteur, $leMois);
            $lesFraisForfait = $pdo->getLesFraisForfait($idVisiteur, $leMois);
            $smarty->assign('lesFraisForfait', $lesFraisForfait);
            $smarty->assign('lesFraisHorsForfait', $lesFraisHorsForfait);

            $lesInfosFicheFrais = $pdo->getLesInfosFicheFrais($idVisiteur, $leMois);
            $numAnnee = substr($leMois, 0, 4);
            $numMois = substr($leMois, 4, 2);
            $smarty->assign('numAnnee', $numAnnee);
            $smarty->assign('numMois', $numMois);


            $libEtat = $lesInfosFicheFrais['libEtat'];
            $montantValide = $lesInfosFicheFrais['montantValide'];
            $nbJustificatifs = $lesInfosFicheFrais['nbJustificatifs'];
            $dateModif = $lesInfosFicheFrais['dateModif'];
            $dateModif = dateAnglaisVersFrancais($dateModif);
            $smarty->assign('libEtat', $libEtat);
            $smarty->assign('montantValide', $montantValide);
            $smarty->assign('nbJustificatifs', $nbJustificatifs);
            $smarty->assign('dateModif', $dateModif);

            $smarty->display('compte.tpl');
        }
}
?>