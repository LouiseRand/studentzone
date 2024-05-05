{extends file="layouts/main.tpl"}
{block name="body"}
<div class="container pt-2">
<h2 class="mt-4 mb-3">Favourite Recipes</h2>
<hr width="100%" color="#FFBF0B" size="5px"/>

<div class="btn-group mb-3" role="group" aria-label="Account menu">
<a href="/studentzone/account" class="btn btn-secondary">Home</a>
<a href="/studentzone/favourite" class="btn btn-secondary">Favourite Recipes</a>
<a href="/studentzone/myrecipes" class="btn btn-secondary">My Recipes</a>
<a href="/studentzone/add" class="btn btn-secondary">Add Recipe</a>
<a href="/studentzone/changepassword" class="btn btn-secondary">Change Password</a>


</div>

<ul class="user-favs">
<div class="row ">
{foreach from=$user_favs item=fav}
   
    <div class="container">
    
            <div class="col-md-3">             
                <div class="recipe-card">
                    <div class="recipe-card-image" style="background-image: url('./user-images/{$fav.recipe_image}');">
                        <a href="/studentzone/recipe&id={$fav.recipe_id}"></a>
                    </div>
                    <a href="/studentzone/recipe&id={$fav.recipe_id}"><h3>{$fav.recipe_name}</h3></a>                             
                </div>                                 
            </div>                   
    </div>
    
{/foreach}
</div>
</ul>













</div>

{/block} 

