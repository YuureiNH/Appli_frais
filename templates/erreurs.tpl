<div class="alert alert-danger" role="alert">
    <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
    <span class="sr-only">Erreur :</span>
    <ul>
        {foreach $_REQUEST['erreurs'] item='erreur'}
            <li>{$erreur}</li>
            {/foreach}
    </ul>
</div>