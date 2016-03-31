 <div id="contenu" class="text-center">
    <h2>Mes fiches de frais</h2>
    <form class="form-horizontal" action="ControllerEtatFrais.php?action=voirEtatFrais" method="post">
        <div class="form-group">
            <div class="col-sm-offset-4 col-sm-4">
                <label for="lstMois" accesskey="n">Mois : </label>
                <select id="lstMois" name="lstMois" class="form-control">
                    {foreach from=$lesMois item=unMois}
                        {assign var="mois" value=$unMois['mois']}
                        {assign var="numAnnee" value=$unMois['numAnnee']}
                        {assign var="numMois" value=$unMois['numMois']}

                        {if $mois == $moisASelectionner}
                            <option selected class="text-center" value="{$mois}">{$numMois}/{$numAnnee}</option>
                        {else}
                            <option selected class="text-center" value="{$mois}">{$numMois}/{$numAnnee}</option>
                        {/if}
                    {/foreach}
                </select>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-4 col-sm-4">
                <input type="submit" class="btn btn-default" />
                <input type="reset" class="btn btn-default" /> 
            </div>
        </div>
    </form>