<?php
	require_once("includes/initialize.php");
	$content='home.php';
	$view = (isset($_GET['page']) && $_GET['page'] != '') ? $_GET['page'] : '';
	switch ($view) {
	
		case '1' :
	    $title=$_GET['calendar'];	
		$content = 'calendar.php';		
		break;

		default :
		$title="Home";	
		$content ='home.php';
	}
	
	require_once 'themes/frontTemplate.php';
	?>
