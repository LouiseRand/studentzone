{extends file="layouts/main.tpl"}
{block name="body"}
    <div class="container mt-4" >  
    <h2 class="mb-4 mb-3">Search results for "{$query}"</h2>

                    

                        <div class="row">
                        {foreach from=$recipes item=recipe}
                            <div class="col-md-3">
                                <div class="recipe-image-box">
                                    <div class="recipe-image" style="background-image: url('/studentzone/user-images/{$recipe.recipe_image}');">
                                        <a href="/studentzone/recipe&id={$recipe.recipe_id}"></a>
                                    </div>
                                    <a href="/studentzone/recipe&id={$recipe.recipe_id}"><h3>{$recipe.recipe_name}</h3></a>                             
                                </div>                         
                            </div>
                        {/foreach}
                            
                        </div> 
                        








    </div>
{/block}