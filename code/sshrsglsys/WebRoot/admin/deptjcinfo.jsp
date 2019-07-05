<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.util.Info"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.PageManager"%>
<%@page import="com.model.Sysuser"%>
<%@page import="com.model.Dept"%>
<%@page import="com.model.Jcinfo"%>
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
 		String hql = " from Jcinfo where  1=1 and uid in (select id from Sysuser where dept='"+user.getDept()+"') ";
        String url = "/sshrsglsys/admin/deptjcinfo.jsp?1=1";
         String key = request.getParameter("key")==null?"":request.getParameter("key");
         String key1 = request.getParameter("key1")==null?"":request.getParameter("key1");
         String key2 = request.getParameter("key2")==null?"":request.getParameter("key2");
         String f = request.getParameter("f");
         if(f==null)
         {
         key = Info.getUTFStr(key);
         }
         
         if(!key.equals(""))
         {
         hql+=" and (name like'%"+key+"%' or sex ='"+key+"' or tel like'%"+key+"%' )";
         url+="&key="+key;
         }
         if(!key1.equals(""))
         {
         hql+=" and (uid ='"+key1+"')";
         url+="&key1="+key1;
         }
         if(!key2.equals(""))
         {
         hql+=" and (type ='"+key2+"')";
         url+="&key2="+key2;
         }
         hql+=" order by id desc";
 %>
   <%
      
      String did = request.getParameter("did");
      if(did!=null)
      {
    	  dao.delete(did,"Jcinfo");
      }
    
         
        PageManager pageManager = PageManager.getPage("deptjcinfo.jsp?1=1",10, request);
	    pageManager.doList(hql);
	    PageManager bean= (PageManager)request.getAttribute("page");
	    ArrayList<Jcinfo> list=( ArrayList<Jcinfo>)bean.getCollection(); %>

<form id="form1" name="form1" method="post" action="deptjcinfo.jsp?f=f">
						<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#BBD3EB">
                          <tr>
                            <td height="26" align="center" bgcolor="#FFFFFF">请输入相关信息</td>
                            <td height="26" align="left" bgcolor="#FFFFFF">
                              <label>
                                &nbsp;
                                	<select id="key1" name="key1">
                            			<option value="">按人员</option>
                            			<%
                            			ArrayList<Sysuser> dlist = (ArrayList<Sysuser>)dao.findByHql("from Sysuser where utype<>'管理员' and delstatus='0' and dept='"+user.getId()+"'"); 
                            			for(Sysuser ss:dlist){%>
                            			<option value="<%=ss.getId() %>"><%=ss.getTname() %></option>
                            			<%} %>
                            		</select>
                            		<select id="key2" name="key2">
                            			<option value="">按类型</option>
                            			<option value="奖励">奖励</option>
                            			<option value="惩罚">惩罚</option>
                            			
                            		</select>
                                <input type="submit" name="button" id="button" value="查询" />
                              </label>                                                    </td>
                          </tr>
</table>

<br />


						<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#BBD3EB">
                          <tr>
                            <td height="27" align="center" background="/sshrsglsys/admin/images/index1_72.gif" bgcolor="#FFFFFF">姓名</td>
                            <td height="27" align="center" background="/sshrsglsys/admin/images/index1_72.gif" bgcolor="#FFFFFF">事项</td>
                            <td height="27" align="center" background="/sshrsglsys/admin/images/index1_72.gif" bgcolor="#FFFFFF">类型</td>
                            <td align="center" background="/sshrsglsys/admin/images/index1_72.gif" bgcolor="#FFFFFF">操作</td>
    </tr>
                         
                         
                         <%
                             for(Jcinfo jc:list)
	                        {
                            	 Sysuser sss = (Sysuser)dao.findById(jc.getUid(),"Sysuser");
                          %>
                          <tr>
                            <td height="26" align="center" bgcolor="#FFFFFF"><%=sss.getTname() %></td>
                            <td height="26" align="center" bgcolor="#FFFFFF"><%=jc.getInfo() %></td>
                            <td height="26" align="center" bgcolor="#FFFFFF"><%=jc.getType() %></td>
                            <td height="26" align="center" bgcolor="#FFFFFF">
                            <a href="deptjcinfo.jsp?did=<%=jc.getId() %>">删除</a>
                            </td>
                          </tr>
                          <%} %>
                          <tr>
                            <td height="26" colspan="10" align="center" bgcolor="#FFFFFF">${page.info }</td>
                            <script language="javascript" src="/sshrsglsys/js/popup.js"></script>
                            <script language="javascript">
                            function update(no)
                            {
                            location.href("linkedit.jsp?id="+no);
                            }
                            
                            function add()
                            {
                            location.href("reg.jsp");
                            }
                            </script>
                            
                          </tr>
</table>      
</form>                 
</body>
</html>
