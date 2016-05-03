<?php
setlocale (LC_TIME, 'fr_FR.utf8','fra');
require 'launcher.php';

$login = '';
if(isset($_COOKIE['login'])) { 
    $login = $_COOKIE['login']; 
} 

$smarty->assign('login', $login);

$smarty->display('index.tpl');

if ($_SERVER['SCRIPT_NAME'] != '/ControllerConnexion.php') {
    require './include/menu_assign.php';
}