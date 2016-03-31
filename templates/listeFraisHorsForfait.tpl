<div class = "table-responsive">
    <table class="table table-striped">
        <caption>Descriptif des éléments hors forfait</caption>
        <tr>
            <th class="date">Date</th>
            <th class="libelle">Libellé</th>  
            <th class="montant">Montant</th>  
            <th class="action">Option</th>              
        </tr>

        {foreach $lesFraisHorsForfait item='unFraisHorsForfait'}
            <tr>
                <td>{$unFraisHorsForfait['date']}</td>
                <td>{$unFraisHorsForfait['libelle']}{if {$unFraisHorsForfait['motifRefus']} != ''}<br />Motif : {$unFraisHorsForfait['motifRefus']}{/if}</td>
                <td>{$unFraisHorsForfait['montant']} €</td>
                <td><a href="ControllerGererFrais.php?action=supprimerFrais&idFrais={$unFraisHorsForfait['id']}" 
                       onclick="return confirm('Voulez-vous vraiment supprimer ce frais?');">Supprimer ce frais</a>
                </td>
            </tr>
        {/foreach}
    </table>
</div>

<form action="ControllerGererFrais.php?action=validerCreationFrais" method="post" class="form-horizontal">
    <legend>Nouvel élément hors forfait</legend>

    <div class="form-group">
        <label for="txtDateHF" class="control-label col-sm-2">Date (jj/mm/aaaa): </label>
        <div class="col-sm-10"> 
            <input type="text" id="txtDateHF" name="dateFrais" class='form-control' value=""  />
        </div>
    </div>

    <div class="form-group">
        <label for="txtLibelleHF" class="control-label col-sm-2">Libellé</label>
        <div class="col-sm-10"> 
            <input type="text" id="txtLibelleHF" name="libelle" class='form-control' value="" />
        </div>
    </div>

    <div class="form-group">
        <label for="txtMontantHF" class="control-label col-sm-2">Montant : </label>
        <div class="col-sm-10"> 
            <input type="text" id="txtMontantHF" name="montant" class='form-control' value="" />
        </div>
    </div>

    <div class="form-group"> 
        <div class="col-sm-offset-2 col-sm-10">
            <input id="ajouter" type="submit" value="Ajouter" class="btn btn-default"/>
            <input id="effacer" type="reset" value="Effacer" class="btn btn-default"/>
        </div>
    </div>
</form>
</div>


