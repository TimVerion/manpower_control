<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
					<form  name="f1" method="post" action="noticeAdd.action" onsubmit="return ck()">
						<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#BBD3EB">
                          	<tr>
                            	<td height="27" align="center" background="/sshrsglsys/admin/images/index1_72.gif" bgcolor="#FFFFFF">标题</td>
                            	<td bgcolor="#FFFFFF">&nbsp;&nbsp;&nbsp;<input type="text" id="title" name="title" size="50"/></td>
    						</tr>
                         	<tr>
                            	<td height="27" align="center" background="/sshrsglsys/admin/images/index1_72.gif" bgcolor="#FFFFFF">内容</td>
                            	<td bgcolor="#FFFFFF">&nbsp;&nbsp;&nbsp;<textarea rows="" cols="" name="content" id="content"></textarea>
									<script  language=javascript src="/sshrsglsys/fckeditor/fckeditor.js"></script>
								</td>
    						</tr>
    						<tr>
                            	<td height="27" align="center" background="/sshrsglsys/admin/images/index1_72.gif" bgcolor="#FFFFFF">类型</td>
                            	<td bgcolor="#FFFFFF">&nbsp;&nbsp;&nbsp;
                            		<select id="type" name="type">
                            			<option value="公告">公告</option>
                            			<option value="会议通知">会议通知</option>
                            		</select>
                            	</td>
    						</tr>
    						<tr>
    							<td height="27" align="center" background="/sshrsglsys/admin/images/index1_72.gif" bgcolor="#FFFFFF"></td>
    							<td bgcolor="#FFFFFF">&nbsp;&nbsp;&nbsp;<input type="submit" value="提交"/><input type="reset" value="重置"/></td>
    						</tr>
                            <script language="javascript">
                            function window.onload() { 
								var of = new FCKeditor("content");
								of.BasePath="/sshrsglsys/fckeditor/";
								of.Height = "300";
								of.ToolbarSet="Default";
								of.ReplaceTextarea();
								
								if(top.location != self.location){ 
								
								var a = window.parent.document.getElementsByTagName('iframe'); 
								
								for (var i=0; i<a.length; i++){ 
								
								if (a[i].name == self.name) {a[i].height = document.body.scrollHeight+150; return;}}} 
								
							}
                            function ck(){
                            	if(f1.title.value==""){
                            		alert("标题不能为空");
                            		return false;
                            	}
                            }

<%
String suc = (String)request.getAttribute("suc");
if(suc!=null)
{
 %>
 alert("操作成功");
location.replace("/sshrsglsys/admin/notice.jsp");
 <%}%>
                            </script>
</table>      
</form>                 
</body>
</html>
