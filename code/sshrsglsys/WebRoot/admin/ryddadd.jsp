<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.model.Dept"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Sysuser"%>
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

<%
  CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");
  String id = request.getParameter("id");
  if(id==null)id = (String)request.getAttribute("id");
  Sysuser ss = (Sysuser)dao.findById(id,"Sysuser");
   %>
					<form  name="f1" method="post" action="ryddadd.action?id=<%=id %>" onsubmit="return ck()">
						<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#BBD3EB">
                          	<tr>
                            	<td height="27" align="center" background="/sshrsglsys/admin/images/index1_72.gif" bgcolor="#FFFFFF">新的部门</td>
                            	<td bgcolor="#FFFFFF">&nbsp;&nbsp;&nbsp;
                            		<select id="dept" name="dept">
                            			<option value="">请选择部门</option>
                            			<%
                            			ArrayList<Dept> dlist = (ArrayList<Dept>)dao.findByHql("from Dept where delstatus='0' and id<>'"+ss.getDept()+"'"); 
                            			for(Dept dept:dlist){%>
                            			<option value="<%=dept.getId() %>"><%=dept.getDeptname() %></option>
                            			<%} %>
                            		</select>
                            	</td>
    						</tr>
    						
    						<tr>
                            	<td height="27" align="center" background="/sshrsglsys/admin/images/index1_72.gif" bgcolor="#FFFFFF">角色</td>
                            	<td bgcolor="#FFFFFF">&nbsp;&nbsp;&nbsp;
                            	<select id="utype" name="utype">
                            			<option value="">请选择</option>
                            			<option value="员工" <%if(ss.getUtype().equals("员工")){out.print("selected==selected");} %>>员工</option>
                            			<option value="部门管理员" <%if(ss.getUtype().equals("部门管理员")){out.print("selected==selected");} %>>部门管理员</option>
                            			
                            		</select>
                            	</td>
    						</tr>
                         	
    						<tr>
    							<td height="27" align="center" background="/sshrsglsys/admin/images/index1_72.gif" bgcolor="#FFFFFF"></td>
    							<td bgcolor="#FFFFFF">&nbsp;&nbsp;&nbsp;<input type="submit" value="提交"/><input type="reset" value="重置"/></td>
    						</tr>
                            <script language="javascript">
                            function ck(){
                            	if(f1.dept.value==""){
                            		alert("部门不能为空");
                            		return false;
                            	}if(f1.utype.value==""){
                            		alert("角色不能为空");
                            		return false;
                            	}
                            }

<%
String suc = (String)request.getAttribute("suc");
if(suc!=null)
{
 %>
 alert("操作成功");
location.replace("/sshrsglsys/admin/rydd.jsp");
 <%}%>
                            </script>
</table>      
</form>                 
</body>
</html>
