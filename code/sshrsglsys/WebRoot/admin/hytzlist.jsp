<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.util.Info"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.PageManager"%>
<%@page import="com.model.Sysuser"%>
<%@page import="com.model.Notice"%>
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
 		 String hql = " from Notice where 1=1 and type='会议通知' ";
         String url = "/sshrsglsys/admin/hytzlist.jsp?1=1";
         String key = request.getParameter("key")==null?"":request.getParameter("key");
         String key2 = request.getParameter("key2")==null?"":request.getParameter("key2");
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
         if(!key2.equals(""))
         {
         hql+=" and (type like'%"+key2+"%' )";
         url+="&key2="+key2;
         }
         hql+=" order by id desc";
      
      String did = request.getParameter("did");
      if(did!=null)
      {
      	dao.delete(did,"Notice");
      }
        PageManager pageManager = PageManager.getPage("hytzlist.jsp?1=1",10, request);
	    pageManager.doList(hql);
	    PageManager bean= (PageManager)request.getAttribute("page");
	    ArrayList<Notice> list=( ArrayList<Notice>)bean.getCollection(); %>

	<form id="form1" name="form1" method="post" action="hytzlist.jsp?f=f">
						<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#BBD3EB">
                          <tr>
                            <td height="26" align="center" bgcolor="#FFFFFF">请输入相关信息</td>
                            <td height="26" align="left" bgcolor="#FFFFFF">
                              <label>
                                &nbsp;<input name="key" type="text" value="<%=key %>" id="textfield" size="40" />&nbsp;
                                
                               
                                <input type="submit" name="button" id="button" value="查询" />
                              </label>                                                    </td>
                          </tr>
</table>

<br />


						<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#BBD3EB">
                          <tr>
                            <td height="27" align="center" background="/sshrsglsys/admin/images/index1_72.gif" bgcolor="#FFFFFF">标题</td>
                            <td height="27" align="center" background="/sshrsglsys/admin/images/index1_72.gif" bgcolor="#FFFFFF">类型</td>
                            <td align="center" background="/sshrsglsys/admin/images/index1_72.gif" bgcolor="#FFFFFF">添加日期</td>
    </tr>
                         
                         <%
                             for(Notice notice:list)
	                        {
                          %>
                          <tr>
                            <td height="26" align="center" bgcolor="#FFFFFF"><a href="noticeview.jsp?id=<%=notice.getId() %>"><%=notice.getTitle() %></a></td>
                            <td height="26" align="center" bgcolor="#FFFFFF"><%=notice.getType() %></td>
                            <td height="26" align="center" bgcolor="#FFFFFF"><%=notice.getSavetime() %></td>
                          </tr>
                          <%} %>
                          <tr>
                            <td height="26" colspan="10" align="center" bgcolor="#FFFFFF">${page.info }</td>
                            <script language="javascript" src="/sshrsglsys/js/popup.js"></script>
                            <script language="javascript">
                            function update(no)
                            {
                            location.href("noticeedit.jsp?id="+no);
                            }
                            </script>
                            
                          </tr>
</table>      
</form>                 
</body>
</html>
