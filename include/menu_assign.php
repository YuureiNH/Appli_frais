<?php

/* Définition du menu */
if (isset($_SESSION['libelle'])) {
    if ($_SESSION['libelle'] == 'visiteur') {
        
        $menu = array();
        $menu[] = array('menu' => 'Saisir fiche frais', 'menu_link' => 'ControllerGererFrais.php?action=saisirFrais');
        $menu[] = array('menu' => 'Consulter fiche de frais', 'menu_link' => 'ControllerEtatFrais.php?action=selectionnerMois');

        $smarty->assign('menu', $menu);
    } else {
        $menu = array();
        $menu[] = array('menu' => 'VALIDER Fiches cloturées', 'menu_link' => '/ControllerValideFrais.php?action=CL', 'compteur' => count($pdo->getFicheParVisiteurEtat('CL')));
        $menu[] = array('menu' => 'Remboursé Fiches validé', 'menu_link' => '/ControllerValideFrais.php?action=VA', 'compteur' => count($pdo->getFicheParVisiteurEtat('VA')));
        $menu[] = array('menu' => 'Bilan annuel par visiteur', 'menu_link' => '/ControllerBilan.php?action=VI');
        $smarty->assign('menu', $menu);
    }
}