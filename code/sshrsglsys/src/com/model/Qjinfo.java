package com.model;

/**
 * Qjinfo entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Qjinfo implements java.io.Serializable {

	// Fields

	private Integer id;
	private String reson;
	private String jkstime;
	private String jstime;
	private String dept;
	private String uid;
	private String shstatus;

	// Constructors

	/** default constructor */
	public Qjinfo() {
	}

	/** full constructor */
	public Qjinfo(String reson, String jkstime, String jstime, String dept,
			String uid, String shstatus) {
		this.reson = reson;
		this.jkstime = jkstime;
		this.jstime = jstime;
		this.dept = dept;
		this.uid = uid;
		this.shstatus = shstatus;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getReson() {
		return this.reson;
	}

	public void setReson(String reson) {
		this.reson = reson;
	}

	public String getJkstime() {
		return this.jkstime;
	}

	public void setJkstime(String jkstime) {
		this.jkstime = jkstime;
	}

	public String getJstime() {
		return this.jstime;
	}

	public void setJstime(String jstime) {
		this.jstime = jstime;
	}

	public String getDept() {
		return this.dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public String getUid() {
		return this.uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getShstatus() {
		return this.shstatus;
	}

	public void setShstatus(String shstatus) {
		this.shstatus = shstatus;
	}

}