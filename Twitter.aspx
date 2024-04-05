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
        align-content: left;
        text-align: center;
        margin-top: 122.5px;
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
    }

    .logsign li:first-child {
        border-radius: 20px;
        margin-bottom: 15px;
        background-color: #1DA1F2;
        text-align: center;
        font-weight: bold;
        color: white;
        width: 380px;
        height: 30px;
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
        height: 30px;
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


    @media (max-width:800px) {

        body {
            margin: 0;
            font-family: Segoe UI;
        }

        .container1 {
            float: none;
            width: 100%;
            margin: 0;
            padding: 0;
            height: 220px;
            background-image: url(img/thumb.png);
            background-size: cover;
            
        }

        .container1 ul {
            margin: 0;
            list-style: none;
            margin-top: 18px;
            margin-left: 67px;

        }
        
        .container1 li {
            font-size: 18px;
            font-weight: bold;
            color: white;
            padding-bottom: 40px;
            text-align: justify;
            padding-left: 5px;
        }

        .container2 img {
            height: 30px;
            width: 35px;
            margin-right: 360px;
            margin-top: 19px;
        }
        
        .container2 p {
            font-size: 28px;
            font-weight: 680;
            text-align: left;
            margin-left: 50px;
            margin-top: 19px;
            line-height: 36px
        }
        
        .tinybold {
            font-size: 14px;
            font-family: Segoe UI;
            font-weight: bold;
            margin-right: 275px;
            margin-top: 53px;
        }
        
        .logsign {
            list-style: none;
            padding-bottom: 3px;
            
        }
        
        .logsign li:first-child {
            border-radius: 20px;
            margin-bottom: 15px;
            background-color: #1DA1F2;
            text-align: center;
            font-weight: bold;
            color: white;
            width: 380px;
            height: 27px;
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
            margin-left: 10px;
            width: 380px;
            height: 25px;
            padding-top: 5px;
            font-size: 15px;
        }

        #foot {
            margin: 15px 0 0 0;
            line-height: 23px;
        }
        
        footer a {
            font-size: 12px;
            margin-right: 3px;
            margin-left: 3px;
            text-align: justify;
            
        }  
        
        #copy {
            text-decoration: none;
        }

    }

    @media (min-width:800px) {

        .no {
            display: none;
        }

        #formobile {
            display: none;
        }
        
        #mobhov {
            display: none;
        }

        #mobhov2 {
            display: none;
        }
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

    .container2{
        justify-content: center;
        margin-left: 1200px;
        align-items: center;
        margin-top: 200px;
    }

    #foot {
        justify-content: center;
        margin-left: 360px;
        align-items: center;
        margin-top: 385px;
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
            <a id="hove" href="#"><li> Sign up </li> </a>
            <a id="hove2" href="#"><li> Log in </li> </a>
        </div>
    </main>
                <div class="no">
                <ul id="formobile">
                <a id="mobhov" href="#"><li> Sign up </li> </a>
                <a id="mobhov2" href="#"><li> Log in </li> </a>
                </ul>
                </div>

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