{extends file="layouts/main.tpl"}
{block name="body"}
    <div class="container">   
    <h1 class="mt-4 mb-3">{$category.cat_name} recipes</h1>

                    <p>Browse some {$category.cat_name} recipes below.</p>

                        <div class="row">
                        {foreach from=$recipes item=recipe}
                            <div class="col-md-3">
                                <div class="recipe-card">
                                    <div class="recipe-card-image" style="background-image: url('./user-images/{$recipe.recipe_image}');">
                                        <a href="/studentzone/recipe&id={$recipe.recipe_id}"></a>
                                    </div>
                                    <a href="/studentzone/recipe&id={$recipe.recipe_id}"><h3>{$recipe.recipe_name}</h3></a>                             
                                </div>                         
                            </div>
                        {/foreach}
                            
                        </div> 
                        
                  
    </div>
{/block}