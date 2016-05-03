<div class='row'>
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">{$smarty.session.libelle|capitalize} {$smarty.session.prenom} {$smarty.session.nom}</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    {foreach $menu item='one_menu'}
                        <li><a href="{$one_menu['menu_link']}">{$one_menu['menu']} {if $one_menu['compteur']|default:0 > 0}({$one_menu['compteur']}){/if}</a></li>
                    {/foreach}
                </ul>
                <ul class="nav navbar-nav navbar-right text-center">
                    <li><button type="button" class="btn btn-danger navbar-btn"><a class="block-link" href="ControllerConnexion.php?logout=true">Déconnexion</a></button></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
    </nav>
</div>