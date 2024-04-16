{extends file="layouts/main.tpl"}

{block name="body"}
    


    <div class="row"><!--search bar-->
      <form id="search-form" method="post" action="">
      
          <div class="col-md-3">

          </div> 
          


          <div class="col-md-3">

          </div>                      
      </form> 
    </div><!--search bar end-->







    
    <h1 class="mt-4 mb-4">Recipe Categories</h1>

        <div class="row">
        {foreach from=$categories item=category}
            <div class="col-md-3">
                <div class="recipe-card">
                    <div class="recipe-card-image" style="background-image: url(./user-images/categories/{$category.cat_image});">
                        <a href="index.php?p=recipes&id={$category.cat_id}"></a>
                    </div>
                    <a href="index.php?p=recipes&id={$category.cat_id}"><h3>{$category.cat_name}</h3></a>                             
                </div>                         
            </div>
        {/foreach}
        </div> 
  









    
{/block}