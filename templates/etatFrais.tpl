<h3>Fiche de frais du mois {$numMois}/{$numAnnee} :</h3>
<div class="encadre">
    <p>
        Etat : {$libEtat} depuis le {$dateModif} <br> 
        Montant validé : {$montantValide}
    </p>
    <div class = "table-responsive">
        <table class="table table-striped">
            <caption>Eléments forfaitisés </caption>
            <tr>
                {foreach $lesFraisForfait item='unFraisForfait'}
                    {assign 'libelle' $unFraisForfait['libelle']}
                    <th>{$libelle}</th>
                    {/foreach}
            </tr>
            <tr>
                {foreach $lesFraisForfait item='unFraisForfait'}
                    {assign 'quantite' $unFraisForfait['quantite']}
                    <td class="qteForfait">{$quantite}</td>
                {/foreach}
            </tr>
        </table>
    </div>
    <div class = "table-responsive">
        <table class="table table-striped">
            <caption>Descriptif des éléments hors forfait [{$nbJustificatifs} justificatifs reçus]</caption>
            <tr>
                <th class="date">Date</th>
                <th class="libelle">Libellé</th>
                <th class='montant'>Montant</th>                
            </tr>
            {foreach $lesFraisHorsForfait item='unFraisHorsForfait'}
                {assign 'montant' $unFraisHorsForfait['montant']}
                {assign 'libelle' $unFraisHorsForfait['libelle']}
                {assign 'date' $unFraisHorsForfait['date']}
                <tr>
                    <td>{$date}</td>
                    <td>{$libelle}</td>
                    <td>{$montant}</td>
                </tr>
            {/foreach}
        </table>
    </div>
</div>
</div>














