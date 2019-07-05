<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.model.Sysuser"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Ccinfo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>管理页面</title>
<!-- 调用CSS，JS -->
<link href="/sshrsglsys/admin/images/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	font-family: "宋体";
	font-size: 12px;
	color: #333333;
	background-color: ;
}
.STYLE1 {
	color: #333333;
	font-size: x-large;
	font-family: Arial, Helvetica, sans-serif;
}
-->
</style>
<script language="javascript">
function window.onload() { 

if(top.location != self.location){ 

var a = window.parent.document.getElementsByTagName('iframe'); 

for (var i=0; i<a.length; i++){ 

if (a[i].name == self.name) {a[i].height = document.body.scrollHeight+320; return;}}} 
} 
</script>
<script language=javascript>
function show(no)
{
for(var i=1;i<20;i++)
{
var a = document.getElementById(no+"@"+i);
if(a==null)
{
continue;
}
if(a.style.display=="")
{
a.style.display="none";
}else{
a.style.display="";
}
}

}
</script>
<script type="text/javascript">
function showzhi(inn)
{
var a = document.getElementById("loca");
a.innerHTML=inn;
}
function change(no)
{
var c = document.getElementById("c");
c.innerHTML=no;
}
</script>

</head>
<body>
<%  Sysuser user = (Sysuser)session.getAttribute("user");  %>
<%
  CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");
  String id = request.getParameter("id");
  if(id==null)id = (String)request.getAttribute("id");
  Ccinfo cc = (Ccinfo)dao.findById(id,"Ccinfo");
   %>
					<form  name="f1" method="post" action="ccEdit.action?id=<%=cc.getId() %>" onsubmit="return ck()">
						<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#BBD3EB">
							<tr>
                            	<td height="27" align="center" background="/sshrsglsys/admin/images/index1_72.gif" bgcolor="#FFFFFF">开始日期</td>
                            	<td bgcolor="#FFFFFF">&nbsp;&nbsp;&nbsp;<input type="text" value="<%=cc.getStime() %>" id="stime" name="stime" size="50" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
                            	</td>
    						</tr>
    						<tr>
                            	<td height="27" align="center" background="/sshrsglsys/admin/images/index1_72.gif" bgcolor="#FFFFFF">结束日期</td>
                            	<td bgcolor="#FFFFFF">&nbsp;&nbsp;&nbsp;<input type="text" value="<%=cc.getEtime() %>" id="etime" name="etime" size="50" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
                            	<script type="text/javascript" src="/sshrsglsys/commfiles/js/calendar/WdatePicker.js" ></script>
                            	</td>
    						</tr>
                          	<tr>
                            	<td height="27" align="center" background="/sshrsglsys/admin/images/index1_72.gif" bgcolor="#FFFFFF">出差地</td>
                            	<td bgcolor="#FFFFFF">&nbsp;&nbsp;&nbsp;<input type="text"  value="<%=cc.getAddr() %>" id="addr" name="addr" size="80"/></td>
    						</tr>
    						<tr>
    							<td height="27" align="center" background="/sshrsglsys/admin/images/index1_72.gif" bgcolor="#FFFFFF"></td>
    							<td bgcolor="#FFFFFF">&nbsp;&nbsp;&nbsp;<input type="submit" value="提交"/><input type="reset" value="重置"/></td>
    						</tr>
                            <script language="javascript">
                            
                            function ck(){
                            	if(f1.stime.value==""){
                            		alert("开始日期不能为空");
                            		return false;
                            	}if(f1.etime.value==""){
                            		alert("结束日期不能为空");
                            		return false;
                            	}
                            	if(f1.addr.value==""){
                            		alert("出差地不能为空");
                            		return false;
                            	}
                            }

<%
String suc = (String)request.getAttribute("suc");
if(suc!=null)
{
 %>
 alert("操作成功");
location.replace("/sshrsglsys/admin/myccinfo.jsp");
 <%}%>
                            </script>
</table>      
</form>                 
</body>
</html>
