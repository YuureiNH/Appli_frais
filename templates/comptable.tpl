{include file="header.tpl" title=test}

{include file="menu.tpl"}

<div style="background-color: white;">
    <img class="img-responsive center-block" src='templates/images/logo.png' />
    {assign "action" $smarty.get.action|default:''}
    {if $action != ''}
        <h2>Cloturer les fiches</h2>
        <table class="table table-striped">
            <tr>
                <th>Selectionner</th>
                <th>Visiteur</th>
                <th>Estimé</th>  
                <th>Date Modif</th>  
            </tr>
            {if $lesFicheCR|default:'empty' != 'empty'}
                <form method="post" action='ControllerValideFrais.php?action={$action}&validate=true'>
                    {counter start=0 skip=1 direction='up' print=FALSE}
                    {foreach $lesFicheCR item='FicheCR'}
                        <tr>
                            <td><INPUT type="checkbox" name="id_fiche{counter}" value="{$FicheCR['id']}|{$FicheCR['mois']}"></td>
                            <td> {$FicheCR['prenom']} {$FicheCR['nom']}</td>
                            <td>{montant id=$FicheCR['id'] mois=$FicheCR['mois']} €</td>
                            <td>{$FicheCR['dateModif']}</td>
                            <td><a class="fancybox fancybox.ajax" href="ControllerDisplay.php?action=voirEtatFrais&id={$FicheCR['id']}&mois={$FicheCR['mois']}&statut={$action}">Détails</a> / <a onclick="edition('ControllerDisplay.php?print=true&action=voirEtatFrais&id={$FicheCR['id']}&mois={$FicheCR['mois']}&statut={$action}');return false;">Imprimer cette page</a></td>
                        </tr>
                    {/foreach}
                    <tr>
                        <td class="text-center" colspan="5"><input {if $action == 'CL'}onclick="return confirm('Attention la validation comptera les justificatifs pour les frais hors forfaits comme reçu);"{/if} class="btn btn-default" type="submit"/></td>
                    </tr>
                </form>
            {/if}
        </table>
    {/if}
</div>
{include file="footer.tpl"}

