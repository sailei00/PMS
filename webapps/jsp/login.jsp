<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/ico" href="/favicon.ico">
<title>欢迎登录</title>
<script type="text/javascript">
	if (self != top) {
		top.location = self.location;
	}
</script>
<style type="text/css">
*{
	border : 0px solid red;
}

html { overflow-x: hidden; overflow-y: auto; }/*隐藏横向滚动，垂直滚动根据内容自适应（去除IE默认垂直滚动条）*/ 
body, h1, h2, h3, h4, h5, h6, hr, p, blockquote,dl, dt, dd, ul, ol, li,pre,fieldset,lengend, button,select, input, textarea,th, td { /* 清除内外边距 */ margin: 0;padding: 0;}
body,button, input, select, textarea {color:#333;/* 设置默认字体 */font: 12px/1 "微软雅黑", Tahoma, Helvetica, Arial, "\5b8b\4f53", sans-serif; /*font: 12px/1 Tahoma, Helvetica, Arial, "宋体", sans-serif;*/}
h1,h2,h3,h4, h5, h6 { font-size: 100%; vertical-align:middle; }   
ul, ol { list-style: none; }  /* 重置列表元素 */ 
/* 重置文本格式元素  */ 
a {text-decoration:none;}
a:hover {text-decoration:none; color:/*#ff6600*/#c72334;}
a:active, a:focus { outline:none; }
q:before, q:after { content: ''; }   
/* 重置表单元素 */ 
legend { color: #000; }
fieldset, img { border: none; }
button, input, select, textarea { font-size: 100%; /* 使得表单元素在 ie 下能继承字体大小 */}     
/* 重置表格元素 */
table {border-collapse:collapse;border-spacing: 0;} 
/* 重置 hr */
 hr { border: none; height: 1px;}
button, input, select,label,img,p{ vertical-align:middle;}
.clear {
     /*clear: both;*/
     height:1px;
     margin-top:-1px; 
     overflow:hidden;
}
.clearfix{ display:block;}


 body
        {
            background: #f3f2f2 url(/images/login_bg1.jpg) repeat-x 0 top;
        }
        #login_main
        {
            background: #f1f1f1;
            margin-top:0px;
            position: relative;
            width: 100%;
        }
        .login_logo
        {
            background: url(/images/logo.jpg) center no-repeat;
            margin-top:150px;
            height: 70px;
            width: 100%;
            
        }
        .login_bg
        {
            background: url(/images/login_bg.jpg) no-repeat center bottom;
            height: 352px;
            width: 100%;
            position: relative;
            top: 0px;
        }
        .login_corp
        {
            text-align: center;
            width: 100%;
            position: absolute;
            bottom: 60px;
        }
        .login_window
        {
            /* background: url(/content/images/login_box.png) no-repeat; */
            height: 100px;
            width: 350px;
            position: absolute;
            left: 50%;
            margin-left: -175px;
            top: 29px;
        }
        .login_window ul
        {
            margin: 25px auto;
            width: 305px;
        }
        .login_window li
        {
            float: left;
            width: 99%;
        }
        .login_window li h5
        {
            float: left;
            font-size: 14px;
            font-weight: bold;
            line-height: 27px;
            width: 60px;
        }
        .login_window li span
        {
            display: block;
            float: left;
        }
        .login_window li a
        {
            line-height: 120%;
        }
        .login_btn
        {
        	background: url(/images/login_button.gif) no-repeat ;			/*使用图片来作为按钮的背景*/
        	height: 33px;       /*设置按钮高度*/
    		width: 101px;      /*设置按钮宽度*/
    		cursor:pointer;    /*设置鼠标移动到按钮上的图标*/
        }
        
        .inputtext_login 
        {
		    background: #fff;			/*设置背景颜色为白色*/
		    border: 1px #a39797 solid;     /*设置边框宽度 */
		    height: 25px;                /*设置文本框高度 */
		    padding: 2px 5px;         /*设置文本框内间距 */
		    font-size: 14px;            /*设置字体大小 */
		    width: 210px;               /*设置文本框宽度 */
		}
		
		.inputtext_pwd 
		{
		    background: #beb9b9;           /*设置背景颜色为白色*/
		    border: 1px #a39797 solid;    /*设置边框宽度 */
		    height: 25px;                        /*设置文本框高度 */
		    padding: 2px 5px;                 /*设置文本框内间距 */
		    font-size: 14px;                    /*设置字体大小 */
		    width: 210px;                       /*设置文本框宽度 */
		}

</style>
</head>
<body>

<div id="login_main">
        <div class="login_logo">
        </div>
        <div class="login_bg">
            <div class="login_window">
        		<form action="/login" method="post"  >
                <ul>
                    <li style="margin-bottom: 15px;">
                        <h5>
                            用户名</h5>
                        <input class="inputtext_login"  name="usercode" type="text" />  
                    </li>
                    <li style="margin-bottom: 18px;">
                        <h5>
                            密 码</h5>
                        <input class="inputtext_pwd"  name="password"  type="password" />
                        <div style="*margin-top: 5px!important; margin: 8px 0 0 60px; width: 220px;">
                         </div>
                    </li>
                    <li>
                        <div style="margin: 0 auto; width: 105px;">
                            <input class="login_btn" type="submit"  value="" />
                        </div>
                    </li>
                </ul>
            	</form>
            </div>
            <div class="login_corp">
                山西三元福达煤业安全指挥中心  毋雷
                <br/><br/>
                <center>2016.5</center></div>
        </div>
    </div>

</body>
</html>