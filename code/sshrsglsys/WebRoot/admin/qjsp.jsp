<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.util.Info"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.PageManager"%>
<%@page import="com.model.Sysuser"%>
<%@page import="com.model.Qjinfo"%>
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
  Sysuser user = (Sysuser)session.getAttribute("user"); 
  %>

   <%
 		 String hql = " from Qjinfo where dept='"+user.getDept()+"' ";
         String url = "/sshrsglsys/admin/qjsp.jsp?1=1";
         String key = request.getParameter("key")==null?"":request.getParameter("key");
         String f = request.getParameter("f");
         if(f==null)
         {
         key = Info.getUTFStr(key);
         }
         if(!key.equals(""))
         {
         hql+=" and (title like'%"+key+"%' )";
         url+="&key="+key;
         }
         hql+=" order by id desc";
      
      String tyid = request.getParameter("tyid");
      if(tyid!=null)
      {
    	  Qjinfo q = (Qjinfo)dao.findById(tyid,"Qjinfo");
    	  q.setShstatus("同意");
    	  dao.update(q);
      }
      String jjid = request.getParameter("jjid");
      if(jjid!=null)
      {
    	  Qjinfo q = (Qjinfo)dao.findById(jjid,"Qjinfo");
    	  q.setShstatus("拒绝");
    	  dao.update(q);
      }
        PageManager pageManager = PageManager.getPage("qjsp.jsp?1=1",10, request);
	    pageManager.doList(hql);
	    PageManager bean= (PageManager)request.getAttribute("page");
	    ArrayList<Qjinfo> list=( ArrayList<Qjinfo>)bean.getCollection(); %>

	<form id="form1" name="form1" method="post" action="qjsp.jsp?f=f">
						

<br />


						<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#BBD3EB">
                          <tr>
                          <td height="27" align="center" background="/sshrsglsys/admin/images/index1_72.gif" bgcolor="#FFFFFF">人员</td>
                            <td height="27" align="center" background="/sshrsglsys/admin/images/index1_72.gif" bgcolor="#FFFFFF">原因</td>
                            <td align="center" background="/sshrsglsys/admin/images/index1_72.gif" bgcolor="#FFFFFF">开始日期</td>
                            <td align="center" background="/sshrsglsys/admin/images/index1_72.gif" bgcolor="#FFFFFF">结束日期</td>
                            <td align="center" background="/sshrsglsys/admin/images/index1_72.gif" bgcolor="#FFFFFF">审批状态</td>
                            <td align="center" background="/sshrsglsys/admin/images/index1_72.gif" bgcolor="#FFFFFF">操作</td>
    </tr>
                         
                         <%
                             for(Qjinfo qj:list)
	                        {
                            	 Sysuser sss = (Sysuser)dao.findById(qj.getUid(),"Sysuser");
                          %>
                          <tr>
                          <td height="26" align="center" bgcolor="#FFFFFF"><%=sss.getTname() %></td>
                            <td height="26" align="center" bgcolor="#FFFFFF"><%=qj.getReson() %></td>
                            <td height="26" align="center" bgcolor="#FFFFFF"><%=qj.getJkstime() %></td>
                            <td height="26" align="center" bgcolor="#FFFFFF"><%=qj.getJstime() %></td>
                             <td height="26" align="center" bgcolor="#FFFFFF"><%=qj.getShstatus() %></td>
                            <td height="26" align="center" bgcolor="#FFFFFF">
                            <%if(qj.getShstatus().equals("待审核")){ %>
                            <a href="qjsp.jsp?tyid=<%=qj.getId() %>">同意</a>
                            |
                            <a href="qjsp.jsp?jjid=<%=qj.getId() %>">拒绝</a>
                            <%} %>
                            </td>
                          </tr>
                          <%}%>
                          <tr>
                            <td height="26" colspan="10" align="center" bgcolor="#FFFFFF">${page.info }</td>
                            <script language="javascript" src="/sshrsglsys/js/popup.js"></script>
                            <script language="javascript">
                            function update(no)
                            {
                            location.href("rcedit.jsp?id="+no);
                            }
                            </script>
                            
                          </tr>
</table>      
</form>                 
</body>
</html>
