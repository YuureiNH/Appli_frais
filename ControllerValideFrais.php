<?php
require ('/launcher.php');

$mois_courant = getMois(date("d/m/Y"));
$nombre_fiche_fermé = $pdo->FermerFicheMoisPrecedent($mois_courant);
if ($nombre_fiche_fermé > 0) {
    if($nombre_fiche_fermé == 1 ) {
        $smarty->assign('info',$nombre_fiche_fermé.' fiche a été fermé');
    } else {
        $smarty->assign('info',$nombre_fiche_fermé.' fiches ont été fermé');
    }
} 

$action = filter_input(INPUT_GET, 'action');
$validate = filter_input(INPUT_GET, 'validate');
$info = filter_input(INPUT_GET, 'info');
if($info){
    if($info == 'remboursement') {
        $smarty->assign('info','Mise en remboursement réussi');
    } else {
        $smarty->assign('info','Validation réussi');
    }
}

$lesFicheCR = $pdo->getFicheParVisiteurEtat($action);
$smarty->assign('lesFicheCR', $lesFicheCR);

if ($validate == true) {
    $fiche_update = filter_input_array(INPUT_POST);
    
    if($fiche_update == false) {
        $fiche_update = array();
        $smarty->assign('erreur', 'Aucune fiche a été choisi');
    }
    
    switch ($action) {
        case 'CR':
            $next_step = 'CL';
            break;
        case 'CL':
            $next_step = 'VA';
            break;

        default:
            break;
    }
    
    foreach ($fiche_update as $fiche) {
        $a_element = explode('|', $fiche);
        $id = $a_element[0];
        $mois = $a_element[1];
        $pdo->majEtatFicheFrais($id, $mois, $next_step);
        $statut_url = '&info=remboursement';
        if ($action == 'CL') {
            $pdo->majNbJustificatifs($id, $mois, count($pdo->getLesFraisHorsForfait($id, $mois, true)));
            $montant_forfait = $pdo->getLesFraisForfaitCl($id, $mois)[0]['montantForfait'];
            $montant_Horsforfait = $pdo->getLesFraisHorsForfaitCl($id, $mois)[0]['montantHorsForfait'];
            $pdo->updateMontantValide($montant_forfait+$montant_Horsforfait,$id, $mois);
            $statut_url = '&info=validation';
        }
        header('Location: ./ControllerValideFrais.php?action='.$action.$statut_url);
        exit();
    }
}

$smarty->display('comptable.tpl');
