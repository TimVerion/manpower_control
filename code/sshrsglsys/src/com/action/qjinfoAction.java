package com.action;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

import com.dao.CommonDAO;
import com.dao.SysuserDAO;
import com.model.Qjinfo;
import com.model.Sysuser;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Info;
import com.util.Pagination;

public class qjinfoAction extends ActionSupport
{
	private Integer id;
	private String reson;
	private String jkstime;
	private String jstime;
	private String dept;
	private String uid;
	private String shstatus;
	private int index=1;
	String no;
	String suc;
	private CommonDAO commonDAO;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getReson() {
		return reson;
	}
	public void setReson(String reson) {
		this.reson = reson;
	}
	public String getJkstime() {
		return jkstime;
	}
	public void setJkstime(String jkstime) {
		this.jkstime = jkstime;
	}
	public String getJstime() {
		return jstime;
	}
	public void setJstime(String jstime) {
		this.jstime = jstime;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getShstatus() {
		return shstatus;
	}
	public void setShstatus(String shstatus) {
		this.shstatus = shstatus;
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
	public CommonDAO getCommonDAO() {
		return commonDAO;
	}
	public void setCommonDAO(CommonDAO commonDAO) {
		this.commonDAO = commonDAO;
	}
	//添加请假
	public String qjinfoAdd()
	{
		Map session= ServletActionContext.getContext().getSession();
		Sysuser user = (Sysuser)session.get("user");
		Qjinfo qj=new Qjinfo();
		qj.setReson(reson);
		qj.setJkstime(jkstime);
		qj.setJstime(jstime);
		qj.setShstatus("待审核");
		qj.setDept(user.getDept());
		qj.setUid(String.valueOf(user.getId()));
		commonDAO.save(qj);
			suc="";
			return "success";
	}
	
	
	 
}
