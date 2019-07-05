package com.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

import com.dao.CommonDAO;
import com.dao.SysuserDAO;
import com.model.Dept;
import com.model.Jcinfo;
import com.model.Sysuser;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Info;
import com.util.Pagination;

public class jcinfoAction extends ActionSupport
{
	private Integer id;
	private String info;
	private String type;
	private Integer uid;
	private String savatime;
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
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getSavatime() {
		return savatime;
	}
	public void setSavatime(String savatime) {
		this.savatime = savatime;
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
	//添加奖惩
	public String jcAdd(){
			Jcinfo jc = new Jcinfo();
			jc.setInfo(info);
			jc.setType(type);
			jc.setUid(uid);
			jc.setSavatime(Info.getDateStr());
			commonDAO.save(jc);
			suc="";
			return "success";
	}
	//编辑奖惩
	public String jcEdit(){
		Jcinfo jc = (Jcinfo)commonDAO.findById(id, "Jcinfo");
		jc.setInfo(info);
		jc.setType(type);
		commonDAO.update(jc);
		id = id;
		suc="";
		return "success";
	}
}
