<?php
// session_start();

error_reporting(E_ALL);
ini_set("display_errors", 1);

try {
    $bdd = new PDO ('mysql:host=localhost; dbname=cyclingBlogPro;charset=UTF8', 'philippe', 'lam62122phil');
} catch (Exception $e) {
    die('Erreur:' . $e->getMessage());
}

?>