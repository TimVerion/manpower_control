package com.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

import com.dao.CommonDAO;
import com.dao.SysuserDAO;
import com.model.Dept;
import com.model.Salary;
import com.model.Sysuser;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Info;
import com.util.Pagination;

public class salaryAction extends ActionSupport
{
	private Integer id;
	private String money;
	private String uid;
	private String month;
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
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
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
	//添加薪资
	public String salaryAdd(){
		
			Salary salary = new Salary();
			salary.setUid(uid);
			salary.setMoney(money);
			salary.setMonth(month);
			ArrayList cklist = (ArrayList)commonDAO.findByHql("from Salary where uid='"+uid+"' and month='"+month+"'");
			if(cklist.size()==0){
				commonDAO.save(salary);
				suc="";
				return "success";
			}else{
				no="";
				return "erro";
			}
			
			
	}
	
}
