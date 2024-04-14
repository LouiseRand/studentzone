{extends file="layouts/main.tpl"}
{block name="body"}
<h1 class="mt-4 mb-3">My Recipes</h1>
<div class="btn-group mb-3" role="group" aria-label="Basic example">
    <a href="/studentzone/account" class="btn btn-secondary">Home</a>
    <a href="/studentzone/favourite" class="btn btn-secondary">Favourite Recipes</a>
    <a href="/studentzone/myrecipes" class="btn btn-secondary">My Recipes</a>
    <a href="/studentzone/add" class="btn btn-secondary">Add Recipe</a>
    <a href="/studentzone/changepassword" class="btn btn-secondary">Change Password</a>
</div>


<ul>
    {foreach from=$user_recipes item=recipe}  <!--$user_recipes is called from myrecipes.php -->
        <div class="row">
        <div class="col-md-3">
            <div class="recipe-card">
                <div class="recipe-card-image" style="background-image: url('/studentzone/user-images/{$recipe.recipe_image}');">
                    <a href="/studentzone/recipe/{$recipe.recipe_id}"></a>
                </div>
                <li><a href="/studentzone/recipe/{$recipe.recipe_id}">{$recipe.recipe_name}</a></li>            
            </div>                         
        </div>
        </div>
    {/foreach}
</ul>













{/block}
