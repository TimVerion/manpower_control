<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.model.Sysuser"%>
<%@page import="com.util.Info"%>
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
<%CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");
  Sysuser user = (Sysuser)session.getAttribute("user");  
  Sysuser sysuser = (Sysuser)dao.findById(user.getId(),"Sysuser");
  %>
					<form  name="f1" method="post" action="uppass.action" onsubmit="return ck()">
					<input type="hidden" id="id" name="id" value="<%=user.getId() %>" />
						<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#BBD3EB">
                          	<tr>
                            	<td height="27" align="center" background="/sshrsglsys/admin/images/index1_72.gif" bgcolor="#FFFFFF">员工号</td>
                            	<td bgcolor="#FFFFFF">&nbsp;&nbsp;&nbsp;<input type="text" id="uname" name="uname" value="<%=sysuser.getUname() %>" disabled=disabled/></td>
    						</tr>
                         	<tr>
                            	<td height="27" align="center" background="/sshrsglsys/admin/images/index1_72.gif" bgcolor="#FFFFFF">密码</td>
                            	<td bgcolor="#FFFFFF">&nbsp;&nbsp;&nbsp;<input type="password" id="upass" name="upass" value="<%=sysuser.getUpass() %>"/></td>
    						</tr>
    						<tr>
                            	<td height="27" align="center" background="/sshrsglsys/admin/images/index1_72.gif" bgcolor="#FFFFFF">姓名</td>
                            	<td bgcolor="#FFFFFF">&nbsp;&nbsp;&nbsp;<input type="text" id="tname" name="tname" value="<%=sysuser.getTname() %>" /></td>
    						</tr>
    						<tr>
                            	<td height="27" align="center" background="/sshrsglsys/admin/images/index1_72.gif" bgcolor="#FFFFFF">性别</td>
                            	<td bgcolor="#FFFFFF">&nbsp;&nbsp;&nbsp;<select id="sex" name="sex">
										<option value="男" <%if(sysuser.getSex().equals("男")){out.print("selected==selected");} %>>男</option>
										<option value="女" <%if(sysuser.getSex().equals("女")){out.print("selected==selected");} %>>女</option>
									</select></td>
    						</tr>
    						<tr>
                            	<td height="27" align="center" background="/sshrsglsys/admin/images/index1_72.gif" bgcolor="#FFFFFF">年龄</td>
                            	<td bgcolor="#FFFFFF">&nbsp;&nbsp;&nbsp;<input type="text" id="age" name="age" value="<%=sysuser.getAge()%>"/></td>
    						</tr>
    						<tr>
                            	<td height="27" align="center" background="/sshrsglsys/admin/images/index1_72.gif" bgcolor="#FFFFFF">电话</td>
                            	<td bgcolor="#FFFFFF">&nbsp;&nbsp;&nbsp;<input type="text" id="tel" name="tel" value="<%=sysuser.getTel() %>"/></td>
    						</tr>
    						<tr>
                            	<td height="27" align="center" background="/sshrsglsys/admin/images/index1_72.gif" bgcolor="#FFFFFF">EMAIL</td>
                            	<td bgcolor="#FFFFFF">&nbsp;&nbsp;&nbsp;<input type="text" id="email" name="email" value="<%=sysuser.getEmail() %>"/></td>
    						</tr>
    						<tr>
    							<td height="27" align="center" background="/sshrsglsys/admin/images/index1_72.gif" bgcolor="#FFFFFF"></td>
    							<td bgcolor="#FFFFFF">&nbsp;&nbsp;&nbsp;<input type="submit" value="提交"/><input type="reset" value="重置"/></td>
    						</tr>
    						
                            <script language="javascript">
                            function ck(){
                            	if(f1.upass.value==""){
                            		alert("密码不能为空");
                            		return false;
                            	}if(f1.tname.value==""){
                            		alert("姓名不能为空");
                            		return false;
                            	}
                            }

<%
String suc = (String)request.getAttribute("suc");
if(suc!=null)
{
 %>
 alert("操作成功");
location.replace("/sshrsglsys/admin/uppass.jsp");
 <%}%>
                            </script>
</table>      
</form>                 
</body>
</html>
