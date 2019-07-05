package com.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import com.dao.SysuserDAO;
import com.model.Sysuser;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Info;
import com.util.Pagination;

public class userAction extends ActionSupport
{
	private Integer id;
	private String uname;
	private String upass;
	private String tname;
	private String sex;
	private String age;
	private String tel;
	private String email;
	private String img;
	private String savetime;
	private String dept;
	private String delstatus;
	private int index=1;
	String no;
	String suc;
	private String utype;
	private SysuserDAO sysuserDAO;
	
	public String getDelstatus() {
		return delstatus;
	}
	public void setDelstatus(String delstatus) {
		this.delstatus = delstatus;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public String getUtype() {
		return utype;
	}
	public void setUtype(String utype) {
		this.utype = utype;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUpass() {
		return upass;
	}
	public void setUpass(String upass) {
		this.upass = upass;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getSavetime() {
		return savetime;
	}
	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getSuc() {
		return suc;
	}
	public void setSuc(String suc) {
		this.suc = suc;
	}
	public SysuserDAO getSysuserDAO() {
		return sysuserDAO;
	}
	public void setSysuserDAO(SysuserDAO sysuserDAO) {
		this.sysuserDAO = sysuserDAO;
	}
	//用户登陆
	public String userlogin(){
		 	Map session= ServletActionContext.getContext().getSession();
				String sql="from Sysuser where uname=? and upass=? and utype=? and delstatus='0'";
				Object[] con={uname,upass,utype};
				List adminList=sysuserDAO.getHibernateTemplate().find(sql,con);
				if(adminList.size()!=0){
					 Sysuser user=(Sysuser)adminList.get(0);
					 session.put("user", user);
					 suc="";
					 return "success";
				}else{
					no="";
					return "erro";
				}
		}
	
	//用户修改信息
	public String uppass()
	{
		Sysuser sysuser=sysuserDAO.findById(id);
		sysuser.setUpass(upass);
		sysuser.setTname(tname);
		sysuser.setSex(sex);
		sysuser.setAge(age);
		sysuser.setEmail(email);
		sysuser.setTel(tel);
		sysuserDAO.attachDirty(sysuser);
		suc="";
		return "success";
	}
	//添加用户
	public String userReg(){
		String hql = " from Sysuser where uname='"+uname+"'";
		List list=sysuserDAO.getHibernateTemplate().find(hql);
		if(list.size()!=0){
			no="";
			return "erro";
		}else{
			Sysuser sysuser = new Sysuser();
			sysuser.setUname(uname);
			sysuser.setUpass(upass);
			sysuser.setTname(tname);
			sysuser.setSex(sex);
			sysuser.setTel(tel);
			sysuser.setAge(age);
			sysuser.setEmail(email);
			sysuser.setUtype(utype);
			sysuser.setDept(dept);
			sysuser.setDelstatus("0");
			sysuser.setSavetime(Info.getDateStr());
			sysuserDAO.save(sysuser);
			suc="";
			return "success";
		}
	}
	//管理员修改用户信息
	public String useredit()
	{
		Sysuser sysuser=sysuserDAO.findById(id);
		sysuser.setUpass(upass);
		sysuser.setTname(tname);
		sysuser.setSex(sex);
		sysuser.setAge(age);
		sysuser.setEmail(email);
		sysuser.setTel(tel);
		sysuser.setUtype(utype);
		sysuser.setDept(dept);
		sysuserDAO.attachDirty(sysuser);
		id = id;
		suc="";
		return "success";
	}
	
	//人员调动
	public String ryddadd(){
		Sysuser sysuser=sysuserDAO.findById(id);
		sysuser.setDept(dept);
		sysuser.setUtype(utype);
		sysuserDAO.attachDirty(sysuser);
		suc="";
		return "success";
	}
}
