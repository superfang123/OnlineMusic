<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html>
	<head>
		<title>��������_����Ա��¼</title>
		<link href="CSS/style.css" rel="stylesheet" />
		<script language="javascript"> 
function check(){
   if(form1.name.value==""){
     alert("���������Ա����");form1.name.focus();return false;
   }
   if(form1.pwd.value==""){
     alert("���������룡");form1.pwd.focus();return false;
   }
   if(form1.checkcode.value==""){
     alert("��������֤�룡");form1.checkcode.focus();return false;
   }
}
</script>
<style type="text/css">

</style>

<script type="text/javascript" src="js/ajax.js"></script>
 <script type="text/javascript" src="js/jquery-1.8.2.js"></script>

<script type="text/javascript">
		//ȥ�����ߵĿո�
		function trim(str){"  zhaojun  "
			str = str.replace(/^\s*/,"");//"zhaojun  " 	
			str = str.replace(/\s*$/,"");//"zhaojun"
			return str; 	
		}
	</script>
	
	<script type="text/javascript">
		$("table tr:last td:nth-child(2)").keyup(function(){
		   alert("sss");
			var checkcode = this.value;
			checkcode = trim(checkcode);//2525
			if(checkcode.length == 4){
				//NO1)
				var ajax = createAJAX();
				//NO2)
				var method = "POST";
				var url = "${pageContext.request.contextPath}/manager.do?action=check&time="+new Date().getTime();
				ajax.open(method,url);
				//NO3)
				ajax.setRequestHeader("content-type","application/x-www-form-urlencoded");
				//NO4)
				var content = "checkcode=" + checkcode;
				ajax.send(content);
			
				//--------------------------------------------------------�ȴ�
				
				//NO5)
				ajax.onreadystatechange = function(){
					if(ajax.readyState == 4){
						if(ajax.status == 200){
							//NO6)
							var tip = ajax.responseText;
							
							//NO7)
							var img = document.createElement("img");
							img.src = tip;
							img.style.width = "14px";
							img.style.height = "14px";
							var td = document.getElementById("res");
							td.innerHTML = "";
							td.appendChild(img);
						}
					}
				}
			}else{
				//���ͼƬ
				var td = document.getElementById("res");
				td.innerHTML = "";
			}
		});  
	</script>	
	</head>

	<body>
		<center>
		<jsp:include page="top.jsp" />
		<div id="navigation" style="font-size: 12px; color: #000000">
			�� ��ӭ�����������������Աע��ҳ�� ף�������зݺ����飡
		</div>
		
		<div id="main" style="padding-top: 5px; margin-bottom: 5px;"
			class="tableBorder_blue">
			<form name="form1" method="post" action="manager.do?action=Vregister"
				onSubmit="return check()">
				<table width="255" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="69" colspan="3" align="center">
							&nbsp;
						</td>
					</tr>
<tr>
	<td width="50" height="30" class="word_gray1">
		��&nbsp;&nbsp;&nbsp;&nbsp;�ţ�
	</td>
	<td width="100" colspan="2">
		<input name="name" type="text" id="name"
			onFocus="this.style.backgroundColor='#FBFFD9'"
			onBlur="this.style.backgroundColor='#FFFFFF'">
	</td>
</tr>
<tr>
	<td height="30" class="word_gray1">
		��&nbsp;&nbsp;&nbsp;&nbsp;�룺
	</td>
	
	<td colspan="2">
		<input name="pwd" type="password" id="pwd"
			onFocus="this.style.backgroundColor='#FBFFD9'"
			onBlur="this.style.backgroundColor='#FFFFFF'">
	</td>
</tr>
<tr>
	<td width="50" height="30" class="word_gray1">
		��&nbsp;֤&nbsp;�룺
	</td>
	<td>
		<input name="checkcode" type="text" id="testID" maxlength="4"
			onFocus="this.style.backgroundColor='#FBFFD9'"
			onBlur="this.style.backgroundColor='#FFFFFF'">
	</td>
	<td width="50"height="30">
		<img  src="testimage.jsp"/>			
	</td>
	<span id="res"></span>
</tr>
					<tr>
						<td height="30" colspan="2" align="center">
							<input name="Submit2" type="submit" class="btn_green" value="ע��">
							&nbsp;
							<input name="Submit3" type="reset" class="btn_green" value="����">
						</td>
					</tr>
				</table>

			</form>
		</div>
		<jsp:include page="adm_copyright.jsp" />
	</center>
	</body>
</html>
