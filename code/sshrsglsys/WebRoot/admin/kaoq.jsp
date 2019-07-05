<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.util.Info"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.PageManager"%>
<%@page import="com.model.Sysuser"%>
<%@page import="com.model.Qd"%>
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
  ArrayList<Qd> cklist = (ArrayList<Qd>)dao.findByHql("from Qd where uid='"+user.getId()+"' and savetime='"+Info.getDateStr().substring(0,10)+"' ");
  if(cklist.size()==0){
	  Qd q = new Qd();
	  q.setUid(user.getId().toString());
	  q.setKstime("");
	  q.setJstime("");
	  q.setSavetime(Info.getDateStr().substring(0,10));
	  q.setFz("0");
	  dao.save(q);
  }
  ArrayList<Qd> listaa = (ArrayList<Qd>)dao.findByHql("from Qd where uid='"+user.getId()+"' and savetime='"+Info.getDateStr().substring(0,10)+"' ");
  
  %>

   

	<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#BBD3EB">
                          <tr>
                            <td height="26" align="center" bgcolor="#FFFFFF">
                            	<%if(listaa.get(0).getKstime().equals("")){ %>
                            	<a href="sbdk.action?id=<%=listaa.get(0).getId() %>">上班打卡</a>
                            	<%} %>
                            </td>
                            <td height="26" align="center" bgcolor="#FFFFFF">
                            <%if(!listaa.get(0).getKstime().equals("")&&cklist.get(0).getJstime().equals("")){ %>
                            	<a href="xbdk.action?id=<%=listaa.get(0).getId() %>">下班打卡</a>
                            <%} %>
                            </td>
                          </tr>
</table>

<br />


						<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#BBD3EB">
                          <tr>
                            <td height="27" align="center" background="/sshrsglsys/admin/images/index1_72.gif" bgcolor="#FFFFFF">日期</td>
                            <td align="center" background="/sshrsglsys/admin/images/index1_72.gif" bgcolor="#FFFFFF">上班时间</td>
                            <td align="center" background="/sshrsglsys/admin/images/index1_72.gif" bgcolor="#FFFFFF">下班时间</td>
                            <td align="center" background="/sshrsglsys/admin/images/index1_72.gif" bgcolor="#FFFFFF">当日考勤时间</td>
    </tr>
       <%
 		 String hql = " from Qd where uid='"+user.getId()+"' ";
         String url = "/sshrsglsys/admin/kaoq.jsp?1=1";
         String key = request.getParameter("key")==null?"":request.getParameter("key");
         String f = request.getParameter("f");
         hql+=" order by id desc";
      
      String did = request.getParameter("did");
      if(did!=null)
      {
      	dao.delete(did,"Note");
      }
        PageManager pageManager = PageManager.getPage("kaoq.jsp?1=1",10, request);
	    pageManager.doList(hql);
	    PageManager bean= (PageManager)request.getAttribute("page");
	    ArrayList<Qd> list=( ArrayList<Qd>)bean.getCollection(); 
	    
	    
	    
	    %>
                         <%
                             for(Qd qd:list)
	                        {
                          %>
                          <tr>
                            <td height="26" align="center" bgcolor="#FFFFFF"><%=qd.getSavetime() %></td>
                            <td height="26" align="center" bgcolor="#FFFFFF"><%=qd.getKstime() %></td>
                            <td height="26" align="center" bgcolor="#FFFFFF"><%=qd.getJstime() %></td>
                            <td height="26" align="center" bgcolor="#FFFFFF"><%=qd.getFz() %>秒
                            （<%=Long.valueOf(qd.getFz())/(60*60) %>小时）
                            </td>
                          </tr>
                          <%} %>
                          <tr>
                            <td height="26" colspan="10" align="center" bgcolor="#FFFFFF">${page.info }</td>
                            <script language="javascript" src="/sshrsglsys/js/popup.js"></script>
                            <script language="javascript">
                            function update(no)
                            {
                            location.href("noteedit.jsp?id="+no);
                            }
                            </script>
                            
                          </tr>
</table>      
</body>
</html>
