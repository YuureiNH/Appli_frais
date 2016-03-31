<?php
require ('/launcher.php');

$action = filter_input(INPUT_GET, 'action');
$year = date('Y');

switch ($action) {
        case 'VI':
            $liste_visiteur = $pdo->getVisiteurHaveForfaitYear($year);
//            $liste_visiteur = array();
            $smarty->assign('liste_visiteur', $liste_visiteur);
            $smarty->display('bilanAnnuel.tpl');
            break;
        case 'voirBilanFrais':
            $idVisiteur = filter_input_array(INPUT_POST);
            
            $visiteur = $pdo->getPersonnelbyID($idVisiteur["idVisiteur"]);
            $montant_forfait = $pdo->getLesFraisForfaitCl($idVisiteur["idVisiteur"], $year, true)[0]['montantForfait'];
            $montant_Horsforfait = $pdo->getLesFraisHorsForfaitCl($idVisiteur["idVisiteur"], $year, true)[0]['montantHorsForfait'];
            
            $smarty->assign('visiteur',$visiteur);
            $smarty->assign('montant_forfait',$montant_forfait);
            $smarty->assign('montant_Horsforfait',$montant_Horsforfait);
            $smarty->assign('montant_total',$montant_forfait+$montant_Horsforfait);

            $smarty->display('bilanAnnuel.tpl');
            break;
        default :
            break;
}