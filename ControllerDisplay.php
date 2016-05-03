<?php
require ('launcher.php');

$action = filter_input(INPUT_GET, 'action');
$idVisiteur = filter_input(INPUT_GET, 'id');
$leMois = filter_input(INPUT_GET, 'mois');
$statut = filter_input(INPUT_GET, 'statut');
$print = filter_input(INPUT_GET, 'print');

$smarty->assign('idVisiteur', $idVisiteur);
$smarty->assign('mois', $leMois);
$smarty->assign('visiteur', $pdo->getPersonnelbyID($idVisiteur));
$smarty->assign('statut', $statut);
$smarty->assign('print', $print);

$lesMois = $pdo->getLesMoisDisponibles($idVisiteur);
$moisASelectionner = $leMois;
$smarty->assign('lesMois', $lesMois);
$smarty->assign('moisASelectionner', $moisASelectionner);

$lesFraisHorsForfait = $pdo->getLesFraisHorsForfait($idVisiteur, $leMois, true);
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
$dateModif = dateAnglaisVersFrancais($lesInfosFicheFrais['dateModif']);
$smarty->assign('libEtat', $libEtat);
$smarty->assign('montantValide', $montantValide);
$smarty->assign('nbJustificatifs', $nbJustificatifs);
$smarty->assign('dateModif', $dateModif);

$smarty->display('bilanvisiteur.tpl');