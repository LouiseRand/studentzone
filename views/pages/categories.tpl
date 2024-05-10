{extends file="layouts/main.tpl"}

{block name="body"}

    <div class="container mt-4">
        <div class="container">
                
            <div class="row">
                <div class="col-md-12">
                    <h2 class="mt-1 mb-4">Recipe Categories</h2>
                    

                </div>

            </div>
        </div>

        <div class="row">
        {foreach from=$categories item=category}
            <div class="col-md-3">
                <div class="recipe-card">
                    <div class="recipe-card-image" style="background-image: url(./user-images/categories/{$category.cat_image});">
                                 
                    </div>
                    <a class="button" href="/studentzone/recipes&id={$category.cat_id}"><h3>{$category.cat_name}</h3></a>                                
                </div>                         
            </div>
        {/foreach}
        </div>










        
    </div>


{/block}
