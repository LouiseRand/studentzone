{extends file="layouts/main.tpl"}
{block name="body"}
<h1 class="mt-4 mb-3">Favourite Recipes</h1>
<div class="btn-group mb-3" role="group" aria-label="Basic example">
    <a href="/studentzone/account" class="btn btn-secondary">Home</a>
    <a href="/studentzone/favourite" class="btn btn-secondary">Favourite Recipes</a>
    <a href="/studentzone/myrecipes" class="btn btn-secondary">My Recipes</a>
    <a href="/studentzone/add" class="btn btn-secondary">Add Recipe</a>
    <a href="/studentzone/changepassword" class="btn btn-secondary">Change Password</a>
</div>

<ul class="user-favs">
{foreach from=$user_favs item=fav}
    <li><a href="/studentzone/recipe&id={$fav.recipe_id}">{$fav.recipe_name}</a></li>
{/foreach}

</ul>



{/block} 
