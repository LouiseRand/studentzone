{extends file="layouts/main.tpl"}
{block name="body"}
    <div class="container">   
    <h2 class="mt-4 mb-3">{$category.cat_name} recipes</h2>

                    <h6>Browse some {$category.cat_name} recipes below:</h6>
                    <hr width="100%" color="#FFBF0B" size="5px"/>
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