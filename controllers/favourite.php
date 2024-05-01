<?php
$Favourite = new Favourite($Conn);
$user_favs = $Favourite->getAllFavouritesForUser();
$Smarty->assign('user_favs', $user_favs);