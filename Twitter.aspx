<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Twitter.aspx.cs" Inherits="IDS348_FinalProject.Twitter" %>

    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Twitter. It's what happening / Twitter</title>
        <style>
    body {
        margin: 0;
        font-family: Segoe UI;
    }

    main {
        display: flex;
        flex-wrap: wrap-reverse;
    }

    .container1 {
        float:left;
        width: 49%;
        text-align: center;
        background-image: url(img/thumb.png);
        height: 572px;
    }

    .container1 ul {
        margin-top: 201px;
        margin-left: 148px;
        list-style: none;
    }

    .container1 li {
        font-size: 19px;
        font-weight: bold;
        color: white;
        padding-bottom: 40px;
        text-align: left;
        list-style-image: url(img/twoman.png);
        padding-left: 10px;
    }

    .container1 li:first-child {
        list-style-image: url(img/search.png);
        
    }

    #convo {
        list-style-image: url(img/msg.png);
    }

    .test {
        text-align: left;
    }

    .container2 {
        float:right;
        width: 50%;
        height: auto;
        text-align: center;
        justify-content: center;
        margin-left: 1200px;
        margin-top: 200px;
        align-items: center;
    }

    .container2 img {
        height: 32px;
        width: 39px;
        margin-right: 336px;
    }

    .container2 p {
        font-size: 30px;
        font-weight: 680;
        text-align: left;
        margin-left: 153px;
        margin-top: 19px;
        line-height: 39px
    }

    .tinybold {
        font-size: 15px;
        font-family: Segoe UI;
        font-weight: bold;
        margin-right: 248px;
        margin-top: 59px;
    }

    .logsign {
        list-style: none;
        padding-bottom: 3px;
        text-align: center;
    }

    .logsign li:first-child {
        border-radius: 20px;
        margin-bottom: 15px;
        background-color: #1DA1F2;
        text-align: center;
        font-weight: bold;
        color: white;
        width: 380px;
        height: 34px;
        padding-top: 7px;
        font-size: 15px;
        
    }

    .logsign li {
        font-weight: bold;
        font-size: 14px;
        color: #1DA1F2;
        border: solid #1DA1F2 1px;
        border-radius: 20px;
        text-align: center;
        margin-left: 115px;
        width: 380px;
        height: 34px;
        padding-top: 7px;
        font-size: 15px;
    }

    .logsign a {
        text-decoration: none;
    }

    #hove li:hover {
        background-color: #1A91DA;
        
    }

    #hove2 li {
        background-color: white;
        color: #1DA1F2;
        
    }

    #hove2 li:hover {
        background-color: #E8F5FE;
        
    }

    footer a {
        text-decoration: none;
        color: gray;
        font-size: 13px;
        padding: 0;
        margin-right: 12px;
        
    }

    footer a:hover {
        text-decoration: underline;
        
    }

    #copy {
        text-decoration: none;
        
    }


    #formobile {
        list-style: none;
        display: flex;
    }

    #mobhov {
        border-radius: 20px;
        margin-bottom: 15px;
        background-color: #1DA1F2;
        color: white;
        font-weight: bold;
        font-size: 15px;
        margin-right: 20px;
        width: 40%;
        height: 30px;
        text-align: center;
        text-decoration: none;
        padding-top: 7px;
        margin-top: 25px;
        margin-left: 17px;
    }

    #mobhov2 {
        border-radius: 20px;
        margin-bottom: 15px;
        background-color: white;
        border: #1DA1F2 1px solid;
        color: #1DA1F2;
        font-weight: bold;
        font-size: 15px;
        margin-right: 5px;
        width: 40%;
        height: 30px;
        text-align: center;
        text-decoration: none;
        padding-top: 7px;
        margin-top: 25px;
    }

    #mobhov:hover {
        background-color: #1A91DA;
        
    }

    #mobhov2:hover {
        background-color: #E8F5FE;
    }

    #foot {
        justify-content: center;
        margin-left: 360px;
        align-items: center;
        margin-top: 345px;
    }

#hove,#mobhov {
    text-decoration: none;
    color: #1DA1F2;
    font-weight: bold;
    font-size: 15px;
    padding: 7px;
    border-radius: 20px;
    display: inline-block;
    text-align: center;
    background-color: white; /* Asegurarse de que el botón sea visible */
    margin-left: 0.5px;
    width: 364px;
    height: 25px;
    position: relative;
    bottom: 6px;
}

#hove:hover,
#mobhov:hover {
    background-color: #E8F5FE; /* Oscurecer ligeramente el botón al pasar el mouse */
}

#hove2,
#mobhov2 {
    text-decoration: none;
    color: white;
    font-weight: bold;
    font-size: 15px;
    padding: 7px 20px;
    border-radius: 20px;
    display: inline-block;
    background-color: #1DA1F2; /* Asegurarse de que el botón sea visible */
    margin-left: 0.5px;
    width: 340px;
    height: 27px;
    position: relative;
    bottom: 7px;
}

#hove2:hover,
#mobhov2:hover {
    background-color: #1A91DA; /* Oscurecer ligeramente el botón al pasar el mouse */
    
}



        </style>
        <link rel="icon" type="image/x-icon" href="DatosDeLaApp\twitter-logo.png">
    </head>
    <body>
    <main>

        <div class="container2">
            <img src="DatosDeLaApp\twitter-logo.png" alt="Logo">
            <p> 
                See what’s happening in
            <br>
                the world right now
            </p>
            <div class="tinybold"> Join Twitter today.</div>
            <br>
            <ul class="logsign">
                <li><a id="hove2" href="LogIn.aspx"> Log in </a></li>
                <li><a id="hove" href="SingUp.aspx"> Sign up </a></li>
                
            </ul>
        </div>
    </main>

        <footer>
            <ul id="foot">
                <a href="#">About</a>
                <a href="#">Help Center</a>
                <a href="#">Terms</a>
                <a href="#">Privacy Policy</a>
                <a href="#">Cookies</a>
                <a href="#">Ads info</a>
                <a href="#">Blog</a>
                <a href="#">Status</a>
                <a href="#">Jobs</a>
                <a href="#">Brand</a>
                <a href="#">Advertise</a>
                <a href="#">Marketing</a>
                <a href="#">Buisness</a>
                <a href="#">Developers</a>
                <a href="#">Directory</a>
                <a href="#">Settings</a>
                <a id="copy"> &copy; 2024 Twitter. Inc</a>

            </ul>
            
        </footer>

    </body>
    </html>
