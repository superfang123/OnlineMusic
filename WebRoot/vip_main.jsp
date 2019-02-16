<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
String typeID="0";
String fieldName="";
String key="";
if(request.getAttribute("songType_more")!=null){
	typeID=request.getAttribute("songType_more").toString();
	fieldName=(String)request.getAttribute("fieldName");
	key=(String)request.getAttribute("key");
}
%>
<jsp:useBean id="pagination" class="com.tools.MyPagination" scope="session"/>
<html>
  <head>
    <title>在线音乐后台首页</title>
	<link href="CSS/style.css" rel="stylesheet"/>
	<script language="javascript">
	function del(para){
		if(confirm("确定要删除该用户吗？")){
			window.location.href="manager.do?action=Vdelete&id="+para;
		}
	}
	
	</script>
  </head>
 <center>
  <body>
<div id="header"><!--包含搜索条件-->
<div id="search">
<jsp:include page="song.do" flush="true">
	  <jsp:param name="action" value="songType"/>
 </jsp:include>
 </div>
 
</div>

<!-------------->
<div id="main" style="padding:0px; margin:0px; margin-bottom:5px;" class="tableBorder_blue">

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="25" align="center"><font color="red">会员账号管理</font> </td>
  </tr>
</table>
<table border="1" width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#999999">
      <tr>
        <td height="27" align="center" bgcolor="#FFFFFF">会员账号</td>
        <td align="center" bgcolor="#FFFFFF">会员密码</td>       
        <td align="center" bgcolor="#FFFFFF">操作</td>
      </tr>
	<logic:iterate id="vip" name="vips" type="com.model.VipForm" scope="request" indexId="ind">
      <tr>
	    <td height="27" bgcolor="#FFFFFF" align="center"/>&nbsp;
        <bean:write name="vip" property="name" filter="true"/></td>     
        <td bgcolor="#FFFFFF" align="center">&nbsp;
        <bean:write name="vip" property="pwd" filter="true" /></td>
        <td align="center" bgcolor="#FFFFFF" ><a  href="#" onClick="del(<bean:write name='vip' property='id'filter='true'/>)">删除</a></td>
      </tr>
	</logic:iterate>
  </table>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0"> 
  <tr> 
	
	<td width="27%" style="padding-left:10px"></td> 
		<td width="73%" height="24"><%=pagination.printCtrl(Integer.parseInt(request.getAttribute("Page").toString()),"manager.do?action=Vlist","")%></td> 
  </tr> 
</table>
</div>
<jsp:include page="adm_copyright.jsp"/>
  </body>
  </center> 
</html>
