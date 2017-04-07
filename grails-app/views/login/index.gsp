<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:700,600' rel='stylesheet' type='text/css'>
    </head>
    <style>
        body{
            font-family: 'Open Sans', sans-serif;
            background:#3498db;
            margin: 0 auto 0 auto;
            width:100%;
            text-align:center;
            margin: 20px 0px 20px 0px;
        }

        p{
            font-size:12px;
            text-decoration: none;
            color:#ffffff;
        }

        h1{
            font-size:1.5em;
            color:#525252;
        }

        .box{
            background:white;
            width:300px;
            border-radius:6px;
            margin: 0 auto 0 auto;
            padding:0px 0px 70px 0px;
            border: #2980b9 4px solid;
        }

        .username{
            background:#ecf0f1;
            border: #ccc 1px solid;
            border-bottom: #ccc 2px solid;
            padding: 8px;
            width:250px;
            color:#AAAAAA;
            margin-top:10px;
            font-size:1em;
            border-radius:4px;
        }

        .password{
            border-radius:4px;
            background:#ecf0f1;
            border: #ccc 1px solid;
            padding: 8px;
            width:250px;
            font-size:1em;
        }

        .btn{
            background:#2ecc71;
            width:125px;
            padding-top:5px;
            padding-bottom:5px;
            color:white;
            border-radius:4px;
            border: #27ae60 1px solid;

            margin-top:20px;
            margin-bottom:20px;
            float:left;
            margin-left:16px;
            font-weight:800;
            font-size:0.8em;
        }

        .btn:hover{
            background:#2CC06B;
        }

        .btn2{
            float:left;
            background:#3498db;
            width:125px;  padding-top:5px;
            padding-bottom:5px;
            color:white;
            border-radius:4px;
            border: #2980b9 1px solid;

            margin-top:20px;
            margin-bottom:20px;
            margin-left:10px;
            font-weight:800;
            font-size:0.8em;
        }

        #btn2:hover{
            background:#3594D2;
        }

        .login_div {
            position: absolute;
            /* Center form on page horizontally & vertically */
            top: 50%;
            left: 50%;
            margin-top: -150px;
            margin-left: -150px;
        }

        .login_form {
            border-radius: 10px;
            margin: 0;
            padding: 0;
        }

        .message {
            font-size:1.0em;
            color:#525252;
        }

    </style>
    <body>

    <div class="login_div">
        <form class="login_form" method="post" action="login">
            <div class="box">
                <h1>Welcome</h1>

                <g:if test="${message}">
                    <div name="message" id="message" class="message">${message}</div>
                </g:if>

                <input type="text" name="username" value="username" onFocus="field_focus(this, 'username');" onblur="field_blur(this, 'username');" class="username" />

                <input type="password" name="password" value="password" onFocus="field_focus(this, 'password');" onblur="field_blur(this, 'password');" class="username" />

                <g:submitButton disabled="false" class="btn" id="sign_in" name="sign_in" value="Sign In"/> <!-- End Btn -->

                <g:submitButton disabled="false" class="btn2" id="sign_up" name="sign_up" value="Sign Up"/> <!-- End Btn2 -->

            </div> <!-- End Box -->

        </form>

        <p>Forgot your password? <u style="color:#f1c40f;">Click Here!</u></p>

    </div>

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js" type="text/javascript"></script>
    <script>
        function field_focus(field, username)
        {
            if(field.value == username)
            {
                field.value = '';
            }
        }

        function field_blur(field, username)
        {
            if(field.value == '')
            {
                field.value = username;
            }
        }

        //Fade in welcome box
        $(document).ready(function(){
            $('.box').hide().fadeIn(1000);
        });

        //Stop click event
        /*$('a').click(function(event){
            event.preventDefault();
        });*/

    </script>
    </body>
</html>