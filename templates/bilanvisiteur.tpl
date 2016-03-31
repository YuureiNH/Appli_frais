{if $print == true}
    <script type="text/javascript">
        window.print();
    </script>
{/if}

<h3>Fiche Frais de {$visiteur['prenom']} {$visiteur['nom']} pour {$numMois}/{$numAnnee}</h3>
<h4>Total estimé : {montant id=$idVisiteur mois=$mois}</h4>
<div class="">
    <fieldset>
        <legend>Eléments forfaitisés</legend>                
        {foreach $lesFraisForfait item='unFrais'}
            {foreach $montantFrais item='montant'}
                {if $unFrais['idfrais'] == $montant['id']}
                    {assign 'idFrais' $unFrais['idfrais']}
                    {assign 'libelle' $unFrais['libelle']}
                    {assign 'quantite' $unFrais['quantite']}
                    <p class="form-group">
                        <label for="idFrais" class="">{$libelle}</label> :
                        <input type="text" id="idFrais" name="lesFrais[{$idFrais}]" class="form-control text-center" value="{$montant['montant']*$quantite} € ({$montant['montant']}€*{$quantite})" readonly>
                    </p>
                {/if}
            {/foreach}
        {/foreach}
    </fieldset>
</div>

<fieldset>
    <legend>Descriptif des frais hors forfait</legend>
    <table class="table table-striped">

        <tr>
            <th class="date">Date</th>
            <th class="libelle">Libellé</th>  
            <th class="montant">Montant</th>  
            {if $statut == 'CL'}<th class="action">Option</th>{/if}    
        </tr>

        {foreach $lesFraisHorsForfait item='unFraisHorsForfait'}
            {assign 'idVisiteur' $unFraisHorsForfait['idVisiteur']}
            {assign 'idFrais' $unFraisHorsForfait['id']}
            {assign 'montant' $unFraisHorsForfait['montant']}
            {assign 'libelle' $unFraisHorsForfait['libelle']}
            {assign 'date' $unFraisHorsForfait['date']}
            <tr>
                <td>{$date}</td>
                <td>{$libelle}</td>
                <td>{$montant} €</td>
                {if $statut == 'CL'}<td><a onclick="refusHorforfait({$idFrais});">Refuser ce frais</a> / <a onclick="deporterHorfait({$idFrais}, '{$idVisiteur}');">Justification non reçus</a></td>{/if}
            </tr>
        {/foreach}


    </table>
</fieldset>
