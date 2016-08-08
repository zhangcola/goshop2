<#assign S_URL=request.contextPath />
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
    <title>电商平台 - 找回密码</title>
    <meta content="" name="keywords">
    <meta content="" name="description">
    <meta content="GoShop" name="author">
    <meta content="GoShop" name="copyright">
    <style type="text/css">
        body {
            _behavior: url(${S_URL}/static/styles/csshover.htc);
        }
    </style>
    <link type="text/css" rel="stylesheet" href="${S_URL}/static/styles/shop/base.css">
    <link type="text/css" rel="stylesheet" href="${S_URL}/static/styles/shop/home_header.css">
    <link type="text/css" rel="stylesheet" href="${S_URL}/static/styles/home_login.css">
    <link rel="stylesheet" href="${S_URL}/static/styles/font-awesome/css/font-awesome.min.css">
    <!--[if IE 7]>
    <link rel="stylesheet" href="${S_URL}/static/styles/font-awesome/css/font-awesome-ie7.min.css">
    <![endif]-->
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="${S_URL}/static/scripts/utils/html5shiv.js"></script>
    <script src="${S_URL}/static/scripts/utils/respond.js"></script>
    <![endif]-->
    <!--[if IE 6]>
    <script src="${S_URL}/static/scripts/utils/IE6_PNG.js"></script>
    <script>
        DD_belatedPNG.fix('.pngFix');
    </script>
    <script>
        // <![CDATA[
if((window.navigator.appName.toUpperCase().indexOf("MICROSOFT")>=0)&&(document.execCommand))
try{
document.execCommand("BackgroundImageCache", false, true);
   }
catch(e){}
// ]]>
</script>
<![endif]-->
    <script>
        var COOKIE_PRE = '5BF5_';
        var _CHARSET = 'utf-8';
        var SITEURL = '${S_URL}';
    </script>
    <script src="${S_URL}/static/scripts/jquery/jquery.js"></script>
    <script src="${S_URL}/static/scripts/jquery/jquery-browser.js"></script>
    <script src="${S_URL}/static/scripts/shop/common.js"></script>
    <script src="${S_URL}/static/scripts/jquery-ui/jquery.ui.js"></script>
    <script src="${S_URL}/static/scripts/jquery/jquery.validation.js"></script>
    <script src="${S_URL}/static/scripts/jquery/jquery.masonry.js"></script>
    <script charset="utf-8" id="dialog_js" src="${S_URL}/static/scripts/dialog/dialog.js">
    </script>
    <link type="text/css" rel="stylesheet" href="${S_URL}/static/scripts/dialog/dialog.css">

    <style type="text/css">
        <!--
        .STYLE1 {
            color: #FF0000;
            font-weight: bold;
            font-size: 24px;
        }

        -->
    </style>

</head>
<body>

<div id="append_parent"></div>
<div id="ajaxwaitid"></div>


<#include "simple_header.ftl"/>

<div class="nc-login-layout">
    <div class="left-pic"> <img border="0" src="${S_URL}/static/images/login/2.jpg"> </div>
    <div class="nc-login">
        <div class="nc-login-title">
            <h3>忘记密码</h3>
        </div>
        <div id="demo-form-site" class="nc-login-content">
            <form id="find_password_form" method="POST" action="find_password.html?for=json">
                <input type="hidden" value="${S_TOKEN}" name="S_TOKEN">
                <dl>
                    <dt>登录账号</dt>
                    <dd style="min-height:54px;">
                        <input type="text" name="username" class="text">
                        <label></label>
                    </dd>
                </dl>
                <dl>
                    <dt>电子邮箱</dt>
                    <dd style="min-height:54px;">
                        <input type="text" name="email" class="text">
                        <label></label>
                    </dd>
                </dl>
                <dl>
                    <dt>验证码</dt>
                    <dd style="min-height:54px;">
                        <input type="text" size="10" maxlength="4" id="captcha" class="text w50 fl" name="captcha">
                        <img border="0" class="fl ml5" id="codeimage" name="codeimage" onclick="javascript:document.getElementById('codeimage').src='${S_URL}/validationCodeServlet.png?t=' + Math.random();"
                             src="${S_URL}/validationCodeServlet.png">
                        <a onclick="javascript:document.getElementById('codeimage').src='${S_URL}/validationCodeServlet.png?t=' + Math.random();"
                           class="ml5" href="javascript:void(0)">看不清，换一张</a>
                        <label></label>
                    </dd>
                </dl>
                <dl class="mb30">
                    <dt></dt>
                    <dd>
                        <input type="button" id="Submit" name="Submit" value="重置密码" class="submit">
                    </dd>
                </dl>
            </form>
        </div>
        <div class="nc-login-bottom"></div>
    </div>
</div>

<script type="text/javascript">
    $(function(){
        $('#Submit').click(function(){
            if($("#find_password_form").valid()){
                ajaxpost('find_password_form', '', '', 'onerror');
            } else{
                document.getElementById('codeimage').src = '${S_URL}/validationCodeServlet.png?t=' + Math.random();
            }
        });
        $('#find_password_form').validate({
            errorPlacement: function(error, element){
                var error_td = element.parent('dd');
                error_td.find('label').hide();
                error_td.append(error);
            },
            rules : {
                username : {
                    required : true
                },
                email : {
                    required : true,
                    email : true
                },
                captcha : {
                    required : true,
                    minlength: 4,
                    remote   : {
                        url : '${S_URL}/register/check/captcha.html',
                        type: 'get',
                        data:{
                            captcha : function(){
                                return $('#captcha').val();
                            }
                        }
                    }
                }
            },
            messages : {
                username : {
                    required : '用户名不能为空'
                },
                email  : {
                    required : '请输入邮箱地址',
                    email : '电子邮箱填写错误'
                },
                captcha : {
                    required : '验证码不能为空',
                    minlength : '验证码错误',
                    remote   : '验证码错误'
                }
            }
        });
    });
</script>
<#include "footer.ftl" />

</body>
</html>