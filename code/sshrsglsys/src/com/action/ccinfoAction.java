package com.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

import com.dao.CommonDAO;
import com.dao.SysuserDAO;
import com.model.Ccinfo;
import com.model.Dept;
import com.model.Jcinfo;
import com.model.Sysuser;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Info;
import com.util.Pagination;

public class ccinfoAction extends ActionSupport
{
	private Integer id;
	private String stime;
	private String etime;
	private String addr;
	private String uid;
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
	public String getStime() {
		return stime;
	}
	public void setStime(String stime) {
		this.stime = stime;
	}
	public String getEtime() {
		return etime;
	}
	public void setEtime(String etime) {
		this.etime = etime;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
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
	//添加出差记录
	public String ccAdd(){
			Ccinfo cc = new Ccinfo();
			cc.setStime(stime);
			cc.setEtime(etime);
			cc.setUid(uid);
			cc.setAddr(addr);
			commonDAO.save(cc);
			suc="";
			return "success";
	}
	//编辑出差记录
	public String ccEdit(){
		Ccinfo cc = (Ccinfo)commonDAO.findById(id, "Ccinfo");
		cc.setStime(stime);
		cc.setEtime(etime);
		cc.setAddr(addr);
		commonDAO.update(cc);
		id = id;
		suc="";
		return "success";
	}
}
