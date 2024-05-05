$(function() {


    $('body').on('click', '#addFav', function(e) {
        var recipe_id = $(this).data('recipeid');
        
        // Log a message inside the click event handler
        console.log('Button clicked. Recipe ID: ' + recipe_id);

        $.ajax({
            method: "POST",
            url: "/studentzone/ajax/togglefav.php",
            dataType: 'json',
            data: { recipe_id: recipe_id }
        })
        .done(function( rtnData ) {
            console.log(rtnData);
            $('#addFav').text('Remove from favourites').attr('id', 'removeFav');
        });
    });




    $('body').on('click', '#removeFav', function(e) {
        var recipe_id = $(this).data('recipeid');

         // Log a message inside the click event handler
        console.log('Button clicked. Recipe ID: ' + recipe_id);
        $.ajax({
            method: "POST",
            url: "/studentzone/ajax/togglefav.php",
            dataType: 'json',
            data: { recipe_id: recipe_id }
        })
        .done(function( rtnData ) {
            console.log(rtnData);
           
            $('#removeFav').text('Add to favourites').attr('id', 'addFav');
        });
        
    });
});


