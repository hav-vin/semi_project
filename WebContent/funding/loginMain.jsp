<%@page contentType="text/html;charset=utf-8"
	import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
  
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
    
    <title>로그인</title>
    <style>
      /* 로그인 footer */

    #login_footer_copyright{
        background-color:rgb(255, 255, 255);
        vertical-align: bottom;
        position: relative;
        height: 160px;
    }

    #login_footer_copyright p{
        text-align: center;
        padding-top: 30px;
    }

    #login_footer_copyright img{
        position: absolute;
        margin: auto;
        left: 0;
        right: 0;
        top:0;
        bottom: 0;
        margin-top: 70px;
    }

    /* 로그인 */

    #login_area{
        width: 100%;
        height: 800px;
        padding: 70px 70px 70px 70px;
        margin: 0;
        background-color: rgb(255, 255, 255);
    }

    #login_box{
        width: 500px;
        height: 100%;
        margin-left: auto;
        margin-right: auto;
    }

    #login_box:after{
        content:"";
        clear: both;
        display: block;
    }

    #login_box_1{
        text-align: center;
        margin-left: auto;
        margin-right: auto;
        padding: 40px;
    }

    #login_box_1 a img{
        width: 400px;
    }

    #login_box_2{
        padding-right: 50px;
        padding-left: 50px;
        margin: 0;
    }

    #login_box_2 input{
        width: 100%;
        height: 20%;
        padding: 10px;
        margin-bottom: 5%;
        font-size: 25px;
    }

    #login_box_2 input::placeholder{
        opacity: 0.5;
    }

    #login_box_3{
        padding-right: 50px;
        padding-left: 50px;
        margin: 0;
    }

    #login_box_3 button{
        width: 100%;
        height: 20%;
        padding: 10px;
        margin-bottom: 5%;
        font-size: 25px;
    }

    #login_box_4{
        height: 10%;
        width: 70%;
        margin-left: auto;
        margin-right: auto;
    }

    #login_box_4 a h4{
        text-align: center;
        color: black;
        font-weight: bold;
    }

    #login_box_4 a h4:hover{
        color: rgb(102, 102, 102);
    }

    #login_box_5{
        height: 10%;
        width: 30%;
        margin-left: auto;
        margin-right: auto;
    }

    #login_box_5 a h4{
        text-align: center;
        font-weight: bold;
    }      
    </style>
</head>
<body style="margin:0;">

    <div id="login_area">
        <form action="funding.do?m=check" method="post" id="login_box">
            <div id="login_box_1"><a href="../"><img src="../img/cf.png"></a></div>
            <div id="login_box_2">
                <input type="text" class="form-control" name="iid" placeholder="ID" required="required">
                <input type="password" class="form-control" name="userpw" placeholder="Password" required="required">
            </div>
            <div id="login_box_3">
                <button class="btn btn-info">로그인</button>
            </div>
            </form>
            <div id="login_box_4">
                <a href="funding.do?m=addmission"><h4>가족이 아니신가요? 가족되기</h4></a>
            </div>
            <div id="login_box_5">
            </div>
    </div>


    <div id="login_footer_copyright">
        <p>Copyright &copy; 젊피중피 Co., Ltd.</p>
        <a href="#"><img src="../img/header.png"></a>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>