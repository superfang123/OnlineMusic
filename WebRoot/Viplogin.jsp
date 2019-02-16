<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html>
	<head>
		<title>在线音乐_会员登录</title>
		<link href="CSS/style.css" rel="stylesheet" />
		<script language="javascript"> 
function check(){
   if(form1.manager.value==""){
     alert("请输入管理员名！");form1.manager.focus();return false;
   }
   if(form1.pwd.value==""){
     alert("请输入密码！");form1.pwd.focus();return false;
   }
}
</script>
<style type="text/css">

</style>
	</head>

	<body>
		<center>
		<jsp:include page="top.jsp" />
		<div id="navigation" style="font-size: 12px; color: #000000">
			→ 欢迎您进入甜橙音乐网会员登录页面，请您填写正确的用户名与密码进行后台登录！ 祝您天天有份好心情！
		</div>
		
		<div id="main" style="padding-top: 5px; margin-bottom: 5px;"
			class="tableBorder_blue">
			<form name="form1" method="post" action="manager.do?action=Vlogin"
				onSubmit="return check()">
				<table width="255" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="69" colspan="2" align="center">
							&nbsp;
						</td>
					</tr>
<tr>
	<td width="74" height="30" class="word_gray1">
		账&nbsp;&nbsp;&nbsp;&nbsp;号：
	</td>
	<td width="181">
		<input name="name" type="text" id="name"
			onFocus="this.style.backgroundColor='#FBFFD9'"
			onBlur="this.style.backgroundColor='#FFFFFF'">
	</td>
</tr>
<tr>
	<td height="30" class="word_gray1">
		密&nbsp;&nbsp;&nbsp;&nbsp;码：
	</td>
	<td>
		<input name="pwd" type="password" id="pwd"
			onFocus="this.style.backgroundColor='#FBFFD9'"
			onBlur="this.style.backgroundColor='#FFFFFF'">
	</td>
</tr>
					<tr>
						<td height="30" colspan="2" align="center">
							<input name="Submit2" type="submit" class="btn_green" value="登录">
							&nbsp;
							<input name="Submit3" type="reset" class="btn_green" value="重置">
						</td>
					</tr>
				</table>

			</form>
		</div>
		<jsp:include page="copyright.jsp" />
	</center>
	</body>
</html>
