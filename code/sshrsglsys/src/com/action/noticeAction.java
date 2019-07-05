package com.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

import com.dao.CommonDAO;
import com.dao.SysuserDAO;
import com.model.Dept;
import com.model.Notice;
import com.model.Sysuser;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Info;
import com.util.Pagination;

public class noticeAction extends ActionSupport
{
	private Integer id;
	private String title;
	private String content;
	private String savetime;
	private String type;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSavetime() {
		return savetime;
	}
	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
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
	//添加公告
	public String noticeAdd(){
		
			Notice notice = new Notice();
			notice.setTitle(title);
			notice.setContent(content);
			notice.setSavetime(Info.getDateStr());
			notice.setType(type);
			commonDAO.save(notice);
			suc="";
			return "success";
	}
	//编辑公告
	public String noticeEdit(){
		Notice notice = (Notice)commonDAO.findById(id, "Notice");
		notice.setTitle(title);
		notice.setContent(content);
		commonDAO.update(notice);
		id = id;
		suc="";
		return "success";
	}
}
