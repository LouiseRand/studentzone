{extends file="layouts/main.tpl"}

{block name="body"}

    <h1 class="mb-4 pb-2">My Account</h1>

    <div class="btn-group mb-3" role="group" aria-label="Account menu">
    <a href="index.php?p=account" class="btn btn-secondary">Home</a>
    <a href="index.php?p=favourite" class="btn btn-secondary">Favourite Recipes</a>
    <a href="index.php?p=myrecipes" class="btn btn-secondary">My Recipes</a>
    <a href="index.php?p=add" class="btn btn-secondary">Add Recipe</a>
    <a href="index.php?p=changepassword" class="btn btn-secondary">Change Password</a>
    </div>


{/block}