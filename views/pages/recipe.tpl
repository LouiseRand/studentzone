{extends file="layouts/main.tpl"}

{block name="body"}
    <h1>recipe</h1>



    <div class="row"><!--search bar-->
      <form id="search-form" method="post" action="">
      
          <div class="col-md-3">

          </div> 
          
          <div class="col-md-6">
            <form action="search.html" method="post" class="d-flex" role="search">
              <input class="form-control me-2" type="search" placeholder="Pizza..." name="query" aria-label="Search">
              <button class="btn btn-outline-dark" type="submit">Search</button>
            </form>  
          </div>

          <div class="col-md-3">

          </div>                      
      </form> 
    </div><!--search bar end-->




  <div class="row">

    <div class="col-md-6">         <!--Block row 1 (3 items)-->
      <div class="row">

        <div class="col-md-4">
          <div class="recipe-image mb-4" style="background-image: url('./images/lunch.jpg');">          <!--image should be replaced with an actual recipe-->
            <a href="./images/lunch.jpg"></a>
          </div>               
        </div>

        <div class="col-md-4">
          
        </div>

        <div class="col-md-4">
          
        </div>
      </div>       
    </div>



    <div class="col-md-6">         <!--Block row 2-->
        
    </div>
</div>

    
{/block}