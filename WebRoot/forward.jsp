<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>


<script type="text/javascript"> 
var t=8;
setInterval("refer()",800); 
function refer(){ 
 if(t==0){ 
 location.href="${pageContext.request.contextPath}/Viplogin.jsp";
 } 
 document.getElementById('show').innerHTML=""+t+"�����ת����¼����";
 t--;
} 
</script> 
<span id="show"></span> 