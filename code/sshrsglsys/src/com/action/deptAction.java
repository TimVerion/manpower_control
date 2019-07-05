package com.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

import com.dao.CommonDAO;
import com.dao.SysuserDAO;
import com.model.Dept;
import com.model.Sysuser;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Info;
import com.util.Pagination;

public class deptAction extends ActionSupport
{
	private Integer id;
	private String deptname;
	private String delstatus;
	private int index=1;
	String no;
	String suc;
	private String utype;
	private CommonDAO commonDAO;
	
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDeptname() {
		return deptname;
	}

	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}

	public String getDelstatus() {
		return delstatus;
	}

	public void setDelstatus(String delstatus) {
		this.delstatus = delstatus;
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

	public String getUtype() {
		return utype;
	}

	public void setUtype(String utype) {
		this.utype = utype;
	}

	

	public CommonDAO getCommonDAO() {
		return commonDAO;
	}

	public void setCommonDAO(CommonDAO commonDAO) {
		this.commonDAO = commonDAO;
	}

	
	
	
	//添加部门
	public String deptAdd(){
		
			Dept dept = new Dept();
			dept.setDeptname(deptname);
			dept.setDelstatus("0");
			commonDAO.save(dept);
			suc="";
			return "success";
	}
	//编辑部门
	public String deptEdit(){
		Dept dept = (Dept)commonDAO.findById(id, "Dept");
		dept.setDeptname(deptname);
		commonDAO.update(dept);
		id = id;
		suc="";
		return "success";
	}
}
