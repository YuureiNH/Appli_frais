{include file="header.tpl" title=test}

{include file="menu.tpl"}
                
<img class="img-responsive center-block" src='templates/images/logo.png' />

{assign "action" $smarty.get.action|default:''}

{if $action == 'selectionnerMois'}
    {include file="listeMois.tpl"}
{else if $action == 'voirEtatFrais'}
    {include file="etatFrais.tpl"}
{else if $action == 'saisirFrais' || $action == 'validerCreationFrais' || $action == 'validerCreationFrais' || $action == 'supprimerFrais' || $action == 'validerMajFraisForfait'}
    {include file="listeFraisForfait.tpl"}
    {include file="listeFraisHorsForfait.tpl"}
{/if}
</div>


{include file="footer.tpl"}

