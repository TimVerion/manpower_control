<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.model.Sysuser"%>
<%@page import="com.util.Info"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>人事考勤管理系统</title>
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
	background-color: #2286C2;
}
.STYLE1 {
	color: #333333;
	font-size: x-large;
	font-family: Arial, Helvetica, sans-serif;
}
-->
</style>

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
Sysuser user = (Sysuser)session.getAttribute("user"); 
 %>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="74" colspan="2" background="/sshrsglsys/admin/images/index1_03.gif">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="2%" rowspan="2">&nbsp;</td>
          <td width="31%" rowspan="2"><span class="STYLE1">人事考勤管理系统</span></td>
          <td width="6%" rowspan="2">&nbsp;</td>
          <td width="61%" height="38" align="right">&nbsp;</td>
        </tr>
        <tr>
          <td align="right">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="right" class="font2">&nbsp;&nbsp;登陆用户：
                <%if(user!=null){ %>
                <%=user.getTname() %>&nbsp;&nbsp;
                <%=Info.getDateStr().substring(0,10) %>
                <%} %>
                <a href="/sshrsglsys/login.jsp" class="font2"><strong>退出</strong></a>&nbsp;</td>
              </tr>
            </table>          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td colspan="2">
      <table width="100%" border="0" cellspacing="10" cellpadding="0">
        <tr>
          <td width="10%" valign="top">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="8" height="8"><img src="/sshrsglsys/admin/images/index1_23.gif" width="8" height="29" /></td>
                <td width="99%" background="/sshrsglsys/admin/images/index1_24.gif"></td>
                <td width="8" height="8"><img src="/sshrsglsys/admin/images/index1_26.gif" width="8" height="29" /></td>
              </tr>
              <tr>
                <td background="/sshrsglsys/admin/images/index1_45.gif"></td>
                <td bgcolor="#FFFFFF" style="padding:0 2px 0 2px; vertical-align:top;height:500px;">
                 
                  <table width="200" border="0" cellpadding="0" cellspacing="5">
                  
                  <%if(user.getUtype().equals("员工")||user.getUtype().equals("部门管理员")) {%>
                  <tr  onClick="show('10')" style="cursor: hand" >
                      <td width="12%" align="center"><img src="/sshrsglsys/admin/images/index1_54.gif" width="15" height="11" /></td>
                      <td width="88%">考勤</td>
                    </tr>
  
                    <tr id="10@1">
                      <td align="center"></td>
                      <td>
                        <table width="100%" border="0" cellspacing="5" cellpadding="0">
                      
                          <tr onClick="change('考勤 > 打卡')" style="cursor: hand" >
                            <td width="18%" align="center"><img src="/sshrsglsys/admin/images/index1_68.gif" width="11" height="14" /></td>
                            <td width="82%"><a href="admin/kaoq.jsp" target="main">打卡</a></td>
                          </tr>
                          
                      <%if(user.getUtype().equals("部门管理员")){%>
                    	  <tr onClick="change('考勤 > 部门考勤统计')" style="cursor: hand" >
                            <td width="18%" align="center"><img src="/sshrsglsys/admin/images/index1_68.gif" width="11" height="14" /></td>
                            <td width="82%"><a href="admin/kaoqtj.jsp" target="main">部门考勤统计</a></td>
                          </tr>
                    	  
                     <% } %>   
                        
                        </table>
                      </td>
                    </tr>
                    <%} %>
                    
                    <%if(user.getUtype().equals("员工")||user.getUtype().equals("部门管理员")) {%>
                    <tr  onClick="show('11')" style="cursor: hand" >
                      <td width="12%" align="center"><img src="/sshrsglsys/admin/images/index1_54.gif" width="15" height="11" /></td>
                      <td width="88%">请假管理</td>
                    </tr>
  
                    <tr id="11@1">
                      <td align="center"></td>
                      <td>
                        <table width="100%" border="0" cellspacing="5" cellpadding="0">
                      <%if(user.getUtype().equals("员工")) {%>
                      <tr onClick="change('请假管理 > 请假申请')" style="cursor: hand" >
                            <td width="18%" align="center"><img src="/sshrsglsys/admin/images/index1_68.gif" width="11" height="14" /></td>
                            <td width="82%"><a href="admin/qjinfoadd.jsp" target="main">请假申请</a></td>
                          </tr>
                          <tr onClick="change('请假管理 > 请假记录')" style="cursor: hand" >
                            <td width="18%" align="center"><img src="/sshrsglsys/admin/images/index1_68.gif" width="11" height="14" /></td>
                            <td width="82%"><a href="admin/qjinfo.jsp" target="main">请假记录</a></td>
                          </tr>
                          <%} %>
                        <%if(user.getUtype().equals("部门管理员")) {%>
                          <tr onClick="change('请假管理 > 请假审批')" style="cursor: hand" >
                            <td width="18%" align="center"><img src="/sshrsglsys/admin/images/index1_68.gif" width="11" height="14" /></td>
                            <td width="82%"><a href="admin/qjsp.jsp" target="main">请假审批</a></td>
                          </tr>
                          <%} %> 
                        
                        </table>
                      </td>
                    </tr>
					<%} %>
					
					
					
					
					
					
					<%if(user.getUtype().equals("部门管理员")){ %>
					<tr  onClick="show('101')" style="cursor: hand" >
                      <td width="12%" align="center"><img src="/sshrsglsys/admin/images/index1_54.gif" width="15" height="11" /></td>
                      <td width="88%">奖惩情况</td>
                    </tr>
  
                    <tr id="101@1">
                      <td align="center"></td>
                      <td>
                        <table width="100%" border="0" cellspacing="5" cellpadding="0">
                      
                          <tr onClick="change('奖惩情况 > 部门人员奖惩情况')" style="cursor: hand" >
                            <td width="18%" align="center"><img src="/sshrsglsys/admin/images/index1_68.gif" width="11" height="14" /></td>
                            <td width="82%"><a href="admin/deptjcinfo.jsp" target="main">部门人员奖惩情况</a></td>
                          </tr>
                        </table>
                      </td>
                    </tr>
					<%} %>
					
					
					
                    <%if(user.getUtype().equals("员工")||user.getUtype().equals("部门管理员")) {%>
                    
                    <tr  onClick="show('41')" style="cursor: hand" >
                      <td width="12%" align="center"><img src="/sshrsglsys/admin/images/index1_54.gif" width="15" height="11" /></td>
                      <td width="88%">出差管理</td>
                    </tr>
                    
                    <tr id="41@1">
                      <td align="center"></td>
                      <td>
                        <table width="100%" border="0" cellspacing="5" cellpadding="0">
                      		<tr onClick="change('出差管理 > 添加出差记录')" style="cursor: hand" >
                            <td width="18%" align="center"><img src="/sshrsglsys/admin/images/index1_68.gif" width="11" height="14" /></td>
                            <td width="82%"><a href="admin/ccinfoadd.jsp" target="main">添加出差记录</a></td>
                          </tr>
                          <tr onClick="change('出差管理 > 出差记录查询')" style="cursor: hand" >
                            <td width="18%" align="center"><img src="/sshrsglsys/admin/images/index1_68.gif" width="11" height="14" /></td>
                            <td width="82%"><a href="admin/myccinfo.jsp" target="main">出差记录查询</a></td>
                          </tr>
                           <%if(user.getUtype().equals("部门管理员")){ %>
                         <tr onClick="change('出差管理 > 部门人员出差情况')" style="cursor: hand" >
                            <td width="18%" align="center"><img src="/sshrsglsys/admin/images/index1_68.gif" width="11" height="14" /></td>
                            <td width="82%"><a href="admin/ccinfotj.jsp" target="main">部门人员出差情况</a></td>
                          </tr>
                        <%} %>
                        </table>
                      </td>
                    </tr>
                   
                    <tr  onClick="show('4')" style="cursor: hand" >
                      <td width="12%" align="center"><img src="/sshrsglsys/admin/images/index1_54.gif" width="15" height="11" /></td>
                      <td width="88%">工资查询</td>
                    </tr>
                    <tr id="4@1">
                      <td align="center"></td>
                      <td>
                        <table width="100%" border="0" cellspacing="5" cellpadding="0">
                      
                          <tr onClick="change('工资查询 > 工资查询')" style="cursor: hand" >
                            <td width="18%" align="center"><img src="/sshrsglsys/admin/images/index1_68.gif" width="11" height="14" /></td>
                            <td width="82%"><a href="admin/mysalary.jsp" target="main">工资查询</a></td>
                          </tr>
                         
                        
                        </table>
                      </td>
                    </tr>
                    
                    <tr  onClick="show('5')" style="cursor: hand" >
                      <td width="12%" align="center"><img src="/sshrsglsys/admin/images/index1_54.gif" width="15" height="11" /></td>
                      <td width="88%">公告&会议通知</td>
                    </tr>
                    
                    <tr id="5@1">
                      <td align="center"></td>
                      <td>
                        <table width="100%" border="0" cellspacing="5" cellpadding="0">
                        <%if(user.getUtype().equals("部门管理员")){ %>
                        <tr onClick="change('公告&会议通知 > 添加')" style="cursor: hand" >
                            <td width="18%" align="center"><img src="/sshrsglsys/admin/images/index1_68.gif" width="11" height="14" /></td>
                            <td width="82%"><a href="admin/noticeadd.jsp" target="main">添加</a></td>
                          </tr>
                          <tr onClick="change('公告&会议通知 > 公告&会议通知管理')" style="cursor: hand" >
                            <td width="18%" align="center"><img src="/sshrsglsys/admin/images/index1_68.gif" width="11" height="14" /></td>
                            <td width="82%"><a href="admin/notice.jsp" target="main">公告&会议通知</a></td>
                          </tr>
                      <%} %>
                      <%if(user.getUtype().equals("员工")){ %>
                          <tr onClick="change('公告&会议通知 > 公告')" style="cursor: hand" >
                            <td width="18%" align="center"><img src="/sshrsglsys/admin/images/index1_68.gif" width="11" height="14" /></td>
                            <td width="82%"><a href="admin/gglist.jsp" target="main">公告</a></td>
                          </tr>
                          
                          <tr onClick="change('公告&会议通知 > 会议通知')" style="cursor: hand" >
                            <td width="18%" align="center"><img src="/sshrsglsys/admin/images/index1_68.gif" width="11" height="14" /></td>
                            <td width="82%"><a href="admin/hytzlist.jsp" target="main">会议通知</a></td>
                          </tr>
                        <%} %>
                        </table>
                      </td>
                    </tr>
                    <%} %>
                    
                    <tr  onClick="show('6')" style="cursor: hand" >
                      <td width="12%" align="center"><img src="/sshrsglsys/admin/images/index1_54.gif" width="15" height="11" /></td>
                      <td width="88%">我的信息</td>
                    </tr>
                    
                    <tr id="6@1">
                      <td align="center"></td>
                      <td>
                        <table width="100%" border="0" cellspacing="5" cellpadding="0">
                      
                          <tr onClick="change('我的信息 > 信息修改')" style="cursor: hand" >
                            <td width="18%" align="center"><img src="/sshrsglsys/admin/images/index1_68.gif" width="11" height="14" /></td>
                            <td width="82%"><a href="admin/uppass.jsp" target="main">信息修改</a></td>
                          </tr>

                        </table>
                      </td>
                    </tr>
               <%if(user.getUtype().equals("管理员")) {%>  
				<tr  onClick="show('7')" style="cursor: hand" >
                      <td width="12%" align="center"><img src="/sshrsglsys/admin/images/index1_54.gif" width="15" height="11" /></td>
                      <td width="88%">基础信息</td>
                    </tr>
                    
                    <tr id="7@1">
                      <td align="center"></td>
                      <td>
                        <table width="100%" border="0" cellspacing="5" cellpadding="0">
                      
                      	  <tr onClick="change('部门信息 > 部门管理')" style="cursor: hand" >
                            <td width="18%" align="center"><img src="/sshrsglsys/admin/images/index1_68.gif" width="11" height="14" /></td>
                            <td width="82%"><a href="admin/deptgl.jsp" target="main">部门管理</a></td>
                          </tr>
                      		
                      
                          <tr onClick="change('用户信息 > 用户管理')" style="cursor: hand" >
                            <td width="18%" align="center"><img src="/sshrsglsys/admin/images/index1_68.gif" width="11" height="14" /></td>
                            <td width="82%"><a href="admin/usergl.jsp" target="main">用户管理</a></td>
                          </tr>

                        </table>
                      </td>
                    </tr>
                    
                    <tr  onClick="show('8')" style="cursor: hand" >
                      <td width="12%" align="center"><img src="/sshrsglsys/admin/images/index1_54.gif" width="15" height="11" /></td>
                      <td width="88%">公告&会议通知</td>
                    </tr>
                    
                    <tr id="8@1">
                      <td align="center"></td>
                      <td>
                        <table width="100%" border="0" cellspacing="5" cellpadding="0">
                      
                      	  <tr onClick="change('公告&会议通知 > 添加')" style="cursor: hand" >
                            <td width="18%" align="center"><img src="/sshrsglsys/admin/images/index1_68.gif" width="11" height="14" /></td>
                            <td width="82%"><a href="admin/noticeadd.jsp" target="main">添加</a></td>
                          </tr>
                      		
                      
                          <tr onClick="change('公告&会议通知 > 公告&会议通知管理')" style="cursor: hand" >
                            <td width="18%" align="center"><img src="/sshrsglsys/admin/images/index1_68.gif" width="11" height="14" /></td>
                            <td width="82%"><a href="admin/notice.jsp" target="main">公告&会议通知</a></td>
                          </tr>

                        </table>
                      </td>
                    </tr>
                    
                    <tr  onClick="show('9')" style="cursor: hand" >
                      <td width="12%" align="center"><img src="/sshrsglsys/admin/images/index1_54.gif" width="15" height="11" /></td>
                      <td width="88%">人事管理</td>
                    </tr>
                    
                    <tr id="9@1">
                      <td align="center"></td>
                      <td>
                        <table width="100%" border="0" cellspacing="5" cellpadding="0">
                      
                      	  <tr onClick="change('人事管理 > 人员调动')" style="cursor: hand" >
                            <td width="18%" align="center"><img src="/sshrsglsys/admin/images/index1_68.gif" width="11" height="14" /></td>
                            <td width="82%"><a href="admin/rydd.jsp" target="main">人员调动</a></td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    
                    <tr  onClick="show('10')" style="cursor: hand" >
                      <td width="12%" align="center"><img src="/sshrsglsys/admin/images/index1_54.gif" width="15" height="11" /></td>
                      <td width="88%">薪资管理</td>
                    </tr>
                    
                    <tr id="10@1">
                      <td align="center"></td>
                      <td>
                        <table width="100%" border="0" cellspacing="5" cellpadding="0">
                      
                      	  <tr onClick="change('薪资管理 > 人员薪资')" style="cursor: hand" >
                            <td width="18%" align="center"><img src="/sshrsglsys/admin/images/index1_68.gif" width="11" height="14" /></td>
                            <td width="82%"><a href="admin/ryxz.jsp" target="main">人员薪资</a></td>
                          </tr>
                          
                          <tr onClick="change('薪资管理 > 薪资查询')" style="cursor: hand" >
                            <td width="18%" align="center"><img src="/sshrsglsys/admin/images/index1_68.gif" width="11" height="14" /></td>
                            <td width="82%"><a href="admin/ryxzsearch.jsp" target="main">薪资查询</a></td>
                          </tr>
                          
                        </table>
                      </td>
                    </tr>
                    
                    
                    <tr  onClick="show('11')" style="cursor: hand" >
                      <td width="12%" align="center"><img src="/sshrsglsys/admin/images/index1_54.gif" width="15" height="11" /></td>
                      <td width="88%">奖惩管理</td>
                    </tr>
                    
                    <tr id="11@1">
                      <td align="center"></td>
                      <td>
                        <table width="100%" border="0" cellspacing="5" cellpadding="0">
                      
                      	  <tr onClick="change('奖惩管理 > 人员奖惩')" style="cursor: hand" >
                            <td width="18%" align="center"><img src="/sshrsglsys/admin/images/index1_68.gif" width="11" height="14" /></td>
                            <td width="82%"><a href="admin/ryjc.jsp" target="main">人员奖惩</a></td>
                          </tr>
                          
                          <tr onClick="change('奖惩管理 > 奖惩记录')" style="cursor: hand" >
                            <td width="18%" align="center"><img src="/sshrsglsys/admin/images/index1_68.gif" width="11" height="14" /></td>
                            <td width="82%"><a href="admin/ryjcsearch.jsp" target="main">奖惩记录</a></td>
                          </tr>
                          
                        </table>
                      </td>
                    </tr>
                    
                    
                    
                    
                    
                    
      <!--               <tr  onClick="show('7')" style="cursor: hand" >
                      <td width="12%" align="center"><img src="/sshrsglsys/admin/images/index1_54.gif" width="15" height="11" /></td>
                      <td width="88%">我的信息</td>
                    </tr>
                    
                    <tr id="7@1">
                      <td align="center"></td>
                      <td>
                        <table width="100%" border="0" cellspacing="5" cellpadding="0">
                      
                          <tr onClick="change('我的信息 > 信息修改')" style="cursor: hand" >
                            <td width="18%" align="center"><img src="/sshrsglsys/admin/images/index1_68.gif" width="11" height="14" /></td>
                            <td width="82%"><a href="admin/uppass.jsp" target="main">信息修改</a></td>
                          </tr>

                        </table>
                      </td>
                    </tr> --> 
                   <%} %>
                   
                   
                  
                   
                   
                  </table>
                </td>
                <td background="/sshrsglsys/admin/images/index1_47.gif"></td>
              </tr>
              <tr>
                <td width="8" height="8"><img src="/sshrsglsys/admin/images/index1_91.gif" width="8" height="8" /></td>
                <td background="/sshrsglsys/admin/images/index1_92.gif"></td>
                <td width="8" height="8"><img src="/sshrsglsys/admin/images/index1_93.gif" width="8" height="8" /></td>
              </tr>
            </table>
          </td>
          <td width="70%" valign="top">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
             <tr>
                <td width="8" height="8"><img src="/sshrsglsys/admin/images/index1_23.gif" width="8" height="29" /></td>
                <td width="99%" background="/sshrsglsys/admin/images/index1_24.gif"></td>
                <td width="8" height="8"><img src="/sshrsglsys/admin/images/index1_26.gif" width="8" height="29" /></td>
              </tr>
              <tr height="200">
                <td height="500" background="/sshrsglsys/admin/images/index1_45.gif"></td>
                <td width="99%" bgcolor="#FFFFFF" style="height:490px; vertical-align:top;">
                  <table width="100%" border="0" cellspacing="10" cellpadding="0">
                    <tr>
                      <td>
                        <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#C4E7FB">
                          <tr>
                            <td>
                              <table width="100%" border="0" cellpadding="0" cellspacing="5" bgcolor="#FFFFFF">
                                <tr>
                                  <td height="20">&nbsp;
                                  <%if(user.getUtype().equals("员工")||user.getUtype().equals("部门管理员")) {%>
                                  &nbsp;&nbsp;&nbsp;您当前的位置：
                                  <div style="display: inline;" id="c">我的联系人</div>
                                  <%}else{ %>
                                  &nbsp;&nbsp;&nbsp;您当前的位置：
                                  <div style="display: inline;" id="c">用户管理</div>
                                  <%} %>
                                  </td>
                                </tr>
                              </table>                            </td>
                          </tr>
                        </table>                      </td>
                    </tr>
                    <tr>
                      <td>
                      <%if(user.getUtype().equals("员工")||user.getUtype().equals("部门管理员")){ %>
                       <iframe width="100%"  scrolling="yes" frameborder="0" height="340" src="admin/gglist.jsp"  style=background:transparent allowtransparency name="main"></iframe>  
                       <%}else{ %>
                       <iframe width="100%"  scrolling="yes" frameborder="0" height="340" src="admin/usergl.jsp"  style=background:transparent allowtransparency name="main"></iframe>  
                     	<%} %>
                     </td>
                    </tr>
                </table>                </td>
                <td background="/sshrsglsys/admin/images/index1_47.gif"></td>
              </tr>
              <tr>
                <td width="8" height="8"><img src="/sshrsglsys/admin/images/index1_91.gif" width="8" height="8" /></td>
                <td background="/sshrsglsys/admin/images/index1_92.gif"></td>
                <td width="8" height="8"><img src="/sshrsglsys/admin/images/index1_93.gif" width="8" height="8" /></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</body>
</html>
