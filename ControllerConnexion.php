<?php
require ('launcher.php');

if (isset($_REQUEST['logout']) && $_REQUEST['logout'] == true) {
    deconnecter();
}

$login = "";
$pwd = "";

if (isset($_POST['login'])) {
    $login = $_POST['login'];
}
if (isset($_POST['pwd'])) {
    $pwd = $_POST['pwd'];
}


if(isset($_POST['remember'])){  
  setcookie("login", $login, time()+60*60*24*100, "/");  
} else {
    setcookie("login");
}

$result = $pdo->getPersonnel($login, $pwd);
$smarty->_current_file = 'toto';
if ($result === FALSE) {
    $smarty->assign('erreur', 'Votre identifiant ou votre mot de passe est incorrect.');
    $smarty->display('index.tpl');
} else {
    connecter($result['id'], $result['nom'], $result['prenom'], $result['libelle']);
}

if (isset($_SESSION['libelle'])) {
    require './include/menu_assign.php';
    if ($_SESSION['libelle'] == 'visiteur') {
        $smarty->display('compte.tpl');
    } else {
        $smarty->display('comptable.tpl');
    }
}

    