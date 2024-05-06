<!DOCTYPE html>
<html>

    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1"> 
        <title> StudentZone</title>
        <script src="https://kit.fontawesome.com/7b3bb89727.js" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="/studentzone/css/styles.css"> <!--css/styles.css--><!--css/styles-light.css-->
        <link rel="icon" type="image/x-icon" href="./studentzone-images/favicon.png">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

        <link href="https://fonts.googleapis.com/css2?family=Encode+Sans+Semi+Expanded:wght@100;200;300;400;500;600;700;800;900&family=Fira+Sans&family=Newsreader:opsz@6..72&family=Quattrocento+Sans:ital,wght@0,400;0,700;1,400;1,700&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Fira+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Newsreader:opsz@6..72&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    </head>

    <body id="page-{$view_name}">
        <header>

         
            <nav class="navbar navbar-expand-lg ">
                <div class="container">
                
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbar" aria-controls="navbar" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <a href="index.php"><img src="/studentzone/images/logo.png" alt="studentzone" width="55" height="50"  /></a>
                    


                    <div class="collapse navbar-collapse" id="navbar">
                        
                        <ul class="navbar-nav me-auto mt-2 mb-lg-0">   <!-- nav item containers-->
                            <li class="nav-item">
                                <a class="nav-link" href="/studentzone/home"><h4 style="font-size: 1.3rem;">Home</h4></a>
                            </li>  
                            <li class="nav-item">
                                <a class="nav-link" href="/studentzone/categories"><h4 style="font-size: 1.3rem;">Categories</h4></a>
                            </li>  
                            
                            <li class="nav-item">
                                <a class="nav-link" href="http://louisevrand.uosweb.co.uk/forum/"><h4 style="font-size: 1.3rem;">Forum</h4></a>
                            </li>

                            {if $user_data}
                                <li class="nav-item">
                                    <a class="nav-link" href="/studentzone/account"><h4 style="font-size: 1.3rem;">Account</h4></a>
                                </li>
                            
                                <li class="nav-item">
                                    <a class="nav-link" href="/studentzone/logout"><h4 style="font-size: 1.3rem;">Logout</h4></a>
                                </li>
                            {else}
                                <li class="nav-item">
                                <a class="nav-link" href="/studentzone/login"><h4 style="font-size: 1.3rem;">Login / Register</h4></a>
                                </li>
                            {/if}   
                              

                        </ul>

                        
                        <form action="/studentzone/search" method="post" class="d-flex" role="search">
                            <input class="form-control me-2" type="search" placeholder="Dinner..." name="query" aria-label="Search">
                            <button class="btn btn-outline-dark" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button> 
                        </form>


                    </div>
                </div>     
            </nav>
        </header>

        
        {block name="body"}{/block}
        
        
       <!-- Footer -->
        <footer class="bg-dark text-white text-center p-4 mt-2">
        &copy; 2024 My Forum
        </footer>
            <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> <!--must be before custom js files-->
            <script src="/studentzone/js/scripts-vendor.min.js"></script>
            <script src="/studentzone/js/scripts.min.js"></script>
            
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
            <script>
                home.init();
            </script>
            
    </body>

</html>