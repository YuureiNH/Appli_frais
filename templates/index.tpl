{include file="header.tpl" title=test}


<h2 class="text-center"> Identification utilisateur</h2>
<form action="/ControllerConnexion.php" method="post" role="form">
    <div class="form-group">
        <label for="login">Login :</label>
        <input type="text" class="form-control" name="login" value="{$login|default:''}">
    </div>
    <div class="form-group">
        <label for="pwd">Mot de passe :</label>
        <input type="password" required class="form-control" name="pwd" value="{$post.pwd|escape|default:''}">
    </div>
    
    <div class="checkbox">
        <label><input type="checkbox" name="remember" {if $login|default:'' != ''}checked{/if}>Se souvenir de moi</label>
    </div>
    
    <button type="submit" class="btn btn-default">Se connecter</button>
</form>

{include file="footer.tpl"}
