package com.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

import com.dao.CommonDAO;
import com.dao.SysuserDAO;
import com.model.Dept;
import com.model.Qd;
import com.model.Sysuser;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Info;
import com.util.Pagination;

public class qdAction extends ActionSupport
{
	private Integer id;
	private String uid;
	private String kstime;
	private String jstime;
	private String savetime;
	private String fz;
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
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getKstime() {
		return kstime;
	}
	public void setKstime(String kstime) {
		this.kstime = kstime;
	}
	public String getJstime() {
		return jstime;
	}
	public void setJstime(String jstime) {
		this.jstime = jstime;
	}
	public String getSavetime() {
		return savetime;
	}
	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}
	public String getFz() {
		return fz;
	}
	public void setFz(String fz) {
		this.fz = fz;
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
	//上班打卡
	public String sbdk(){
		Qd qd = (Qd)commonDAO.findById(id, "Qd");
			qd.setKstime(Info.getDateStr());
			commonDAO.update(qd);
			suc="";
			return "success";
	}
	//下班打卡
	public String xbdk(){
		Qd qd = (Qd)commonDAO.findById(id, "Qd");
		qd.setJstime(Info.getDateStr());
		long a = ((Info.daysBetween(qd.getJstime(),qd.getKstime())%(1000 * 60 * 60))/(1000));
		qd.setFz(String.valueOf(a));
		commonDAO.update(qd);
		suc="";
		return "success";
	}
}
