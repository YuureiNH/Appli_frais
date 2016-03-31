<!DOCTYPE html>
<HTML>
    <head>
        <TITLE>APPLI-FRAIS</TITLE>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <link rel="shortcut icon" type="image/png" href="/templates/images/gsb.ico" />
        <!-- JQUERY CDN -->
        <script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>

        <!-- JS -->
        <script type="text/javascript" src="./templates/js/function.js"></script>

        <!-- FANCYBOX -->
        <!-- Add fancyBox main JS and CSS files -->
        <script type="text/javascript" src="./templates/js/jquery.fancybox.js?v=2.1.5"></script>
        <link rel="stylesheet" type="text/css" href="./templates/styles/jquery.fancybox.css?v=2.1.5" media="screen" />
        <script type="text/javascript" src="./templates/js/fancybox.js?"></script>

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
        <link rel="shortcut icon" type="image/x-icon" href="./images/favicon.ico" />

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

        <link href="./templates/styles/styles.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <h1 class="text-center">Laboratoire pharmaceutique - Gestion des frais de visite </h1>
        <div class="container">
            {if $erreur != ''}
                <div class="alert alert-danger" role="alert">
                    <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                    <span class="sr-only">Erreur :</span>
                    {$erreur}
                </div>
            {/if}
            {if $info|default:'' != '' }
                {include file="info.tpl"}
            {/if}