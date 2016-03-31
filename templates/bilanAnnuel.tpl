{include file="header.tpl" title=test}

{include file="menu.tpl"}
                
<img class="img-responsive center-block" src='templates/images/logo.png' />

{assign "action" $smarty.get.action|default:''}

{if $action == 'VI'}
    ﻿<div id="contenu" class="text-center">
    <h2>Bilan annuel des visiteurs</h2>
    {if $liste_visiteur|@count < 1 || $liste_visiteur == false}
        {assign 'info' 'Bilan disponible pour aucun visiteur'}
        {include file="info.tpl"}
    {else}
    <form class="form-horizontal" action="ControllerBilan.php?action=voirBilanFrais" method="post">
        <div class="form-group">
            <div class="col-sm-offset-4 col-sm-4">
                <label for="idVisiteur" accesskey="n">Visiteurs : </label>
                <select id="idVisiteur" name="idVisiteur" class="form-control">
                    {foreach from=$liste_visiteur item=visiteur}
                        <option class="text-center" value="{$visiteur['idVisiteur']}">{$visiteur['prenom']} - {$visiteur['nom']}</option>
                    {/foreach}
                </select>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-4 col-sm-4">
                <input type="submit" class="btn btn-default" />
            </div>
        </div>
    </form>
    {/if}
{else}
    <div id="contenu" class="text-center">
    <h2>Bilan annuel des frais de {$visiteur['prenom']} - {$visiteur['nom']}</h2>
    
    <table class="table table-striped">
        <tr>
            <td class="text-center"><h4><b>Montant total des frais : </b>{$montant_total} €</h4></td>
        </tr>
        <tr>
            <td>Montant total des frais forfait : {$montant_forfait} € ({math equation="(( x * 100 ) / z )" x=$montant_forfait z=$montant_total format="%.2f"}%)</td>
        </tr>
        <tr>
            <td>Montant total des frais hors forfait : {$montant_Horsforfait} € ({math equation="(( x * 100 ) / z )" x=$montant_Horsforfait z=$montant_total format="%.2f"}%)</td>
        </tr>
    </table>
{/if}


</div>


{include file="footer.tpl"}