<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html>
	<head>
		<title>��������_��Ա��¼</title>
		<link href="CSS/style.css" rel="stylesheet" />
		<script language="javascript"> 
function check(){
   if(form1.manager.value==""){
     alert("���������Ա����");form1.manager.focus();return false;
   }
   if(form1.pwd.value==""){
     alert("���������룡");form1.pwd.focus();return false;
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
			�� ��ӭ�����������������Ա��¼ҳ�棬������д��ȷ���û�����������к�̨��¼�� ף�������зݺ����飡
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
		��&nbsp;&nbsp;&nbsp;&nbsp;�ţ�
	</td>
	<td width="181">
		<input name="name" type="text" id="name"
			onFocus="this.style.backgroundColor='#FBFFD9'"
			onBlur="this.style.backgroundColor='#FFFFFF'">
	</td>
</tr>
<tr>
	<td height="30" class="word_gray1">
		��&nbsp;&nbsp;&nbsp;&nbsp;�룺
	</td>
	<td>
		<input name="pwd" type="password" id="pwd"
			onFocus="this.style.backgroundColor='#FBFFD9'"
			onBlur="this.style.backgroundColor='#FFFFFF'">
	</td>
</tr>
					<tr>
						<td height="30" colspan="2" align="center">
							<input name="Submit2" type="submit" class="btn_green" value="��¼">
							&nbsp;
							<input name="Submit3" type="reset" class="btn_green" value="����">
						</td>
					</tr>
				</table>

			</form>
		</div>
		<jsp:include page="copyright.jsp" />
	</center>
	</body>
</html>
