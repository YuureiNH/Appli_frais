<?php
// BONUS 
    //@TODO tester sur mobile
    //@TODO : Déplacer les fichiers controlleur
    //@TODO : connexion page plus petite
    //@TODO : garder la saisie en cours validé

session_start();
require ('/include/class.pdogsb.inc.php');
$pdo = PdoGsb::getPdoGsb();
require ('/include/fct.inc.php');
require '/libs/Smarty.class.php';

if (!isset($smarty)) {
    $smarty = new Smarty;
}

//$smarty->force_compile = true;
$smarty->debugging = false;
$smarty->caching = false;
$smarty->cache_lifetime = 120;

$smarty->assign('erreur', '');


$smarty->assign('montantFrais', $pdo->getLesFrais());

require './include/menu_assign.php';
