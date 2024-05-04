<?php
session_start();
require_once(__DIR__.'/config.include.php');
require_once(__DIR__.'/db.include.php');
require_once(__DIR__.'/../vendor/autoload.php');

// Setup Smarty
$Smarty = new Smarty;
$Smarty->setTemplateDir(__DIR__.'/../views')
       ->setPluginsDir(array(__DIR__.'/..smarty/plugins'))
       ->setCompileDir(__DIR__.'/..smarty/templates_c')
       ->setCacheDir(__DIR__.'/../smarty/cache')
       ->setConfigDir(__DIR__.'/../smarty/configs');
       
// Register the nl2br modifier with Smarty
$Smarty->registerPlugin('modifier', 'nl2br', 'nl2br');
require_once(__DIR__.'/autoloader.include.php');

if($_SESSION['is_loggedin']) {
       $User = new User($Conn);
       $active_user_data = $User->getUser($_SESSION['user_data']['user_id']);
       $Smarty->assign('user_data', $active_user_data);
}
