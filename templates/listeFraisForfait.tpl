<div id="contenu">
    <h2>Renseigner ma fiche de frais du mois {$numMois}/{$numAnnee}</h2>
    <form method="POST" role="form" action="ControllerGererFrais.php?action=validerMajFraisForfait" class="form-horizontal">
        <legend>Eléments forfaitisés</legend>    
        {foreach $lesFraisForfait item='unFrais'}
            {assign 'idFrais' $unFrais['idfrais']}
            {assign 'libelle' $unFrais['libelle']}
            {assign 'quantite' $unFrais['quantite']}
            {foreach $montantFrais item='montant'}
                {if $unFrais['idfrais'] == $montant['id']}
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="idFrais">{$libelle} ({$montant['montant']}€*{$quantite}):</label>
                        <div class="col-sm-9"> 
                            <input type="text" class="form-control" id="idFrais" name="lesFrais[{$idFrais}]" value="{$quantite}">
                        </div>
                    </div>
                {/if}
            {/foreach}
        {/foreach}
        <div class="form-group"> 
            <div class="col-sm-offset-2 col-sm-10">
                <input id="ok" type="submit" value="Valider" size="20"  class="btn btn-default"/>
                <input id="annuler" type="reset" value="Effacer" size="20" class="btn btn-default"/>
            </div> 
        </div> 
    </form>
