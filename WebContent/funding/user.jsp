<%@page contentType="text/html;charset=utf-8"%>


<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Jua|Nanum+Gothic+Coding" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
   
 
    <title>회원가입</title>
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
        padding-top: 10px;
    }

    #login_footer_copyright img{
        position: absolute;
        margin: auto;
        left: 0;
        right: 0;
        top: 0;
        bottom: 0;
        margin-top: 70px;
    }

    /* 로그인 */

    #login_area{
        width: 100%;
        height: 800px;
        padding: 30px 70px 70px 70px;
        margin: 0;
        background-color: rgb(248, 248, 248);
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
        padding: 30px;
    }

    #login_box_1 a img{
        width: 300px;
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
        padding-right: 10px;
        padding-left: 10px;
        margin: 0;
    }

    #login_box_3 button{
        width: 100%;
        height: 60px;
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

    /* 회원가입 */

    #admission_area{
        width: 100%;
        height: 900px;
        padding: 0 70px 0 70px;
        margin: 0;
        background-color: rgb(248, 248, 248);
    }
     #idbox button{
        float: right;
        width: 30%;
        height: 41px;
    }

    #admission_box_1{
        padding-right: 50px;
        padding-left: 50px;
        padding: 10px;
        margin: 0;
    }

    #idbox input{
        float: left;
        margin-right: 4px;
        width: 100%;
    }

    #admission_box_1 input{
        /* width: 100%; */
        height: 41px;
        padding: 10px;
        margin-bottom: 5%;
        font-size: 15px;
    }

    #sel_type{
        height: 41px;
        font-size: 15px;
        margin-bottom: 5%;
    }

    #in_mail input{
        float: left;
        margin-right: 4px;
        width: 50%;
    }

    #in_mail select{
        float: right;
        padding: 10px;
        width: 40%;
        height: 41px;
        
    }

    </style>

</head>
<body style="margin:0;">

    <div id="admission_area">
        <form method="post" id="login_box" name="adform">
            <div id="login_box_1"><a href="../index.do"><img src="../img/crowd2.png"></a></div>

            <div id="admission_box_1">
                <h3>회원가입</h3>

                <div id="idbox">
                    <input type="text" id="uid" class="form-control" name="userid" placeholder="ID를 입력해주세요" required="required">
                    
                </div>
   
                <input type="password" class="form-control" name="upwd" placeholder="PW를 입력해주세요" required="required">

<!--                 <input type="password" class="form-control" name="checkpw" placeholder="패스워드 재확인" required="required"> -->

                <input type="text" class="form-control" name="uname" placeholder="닉네임을 입력해주세요(4~10자까지 입력가능)" required="required">

                <div id="in_mail">
                    <input type="text" class="form-control" name="uemail" placeholder="메일주소" required="required"> 
                    <select name="mailadd" class="form-control">
                        <option value="naver.com">@naver.com</option>
                        <option value="daum.net">@daum.net</option>
                        <option value="gmail.com">@gmail.com</option>
                    </select>
                </div>

            </div>
            <div id="login_box_3">
            
                <button id="admission_btn" class="btn btn-info">회원가입</button>
                
            </div>

            <div id="login_box_3">
                <button type="reset"  id="reset_btn" class="btn btn-info">RESET</button>
            </div>
        </form>

    </div>


    <div id="login_footer_copyright">
        <p>개인정보처리방침 | 저작권정책 | 업무별전화번호안내 | 이용안내</p>
        <a href="../index.do"><img src="../img/crowd.png"></a>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="../bootstrap/js/bootstrap.min.js"></script>
	<script>
		$(document).ready(function(){
			$("#admission_btn").click(function(){
				console.log("asdasdsd");
				$("#login_box").attr("action", "funding.do?m=input");
			});
		});
		
		
	</script>
</body>
