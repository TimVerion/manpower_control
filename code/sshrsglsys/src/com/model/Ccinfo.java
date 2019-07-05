package com.model;

/**
 * Ccinfo entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Ccinfo implements java.io.Serializable {

	// Fields

	private Integer id;
	private String stime;
	private String etime;
	private String addr;
	private String uid;

	// Constructors

	/** default constructor */
	public Ccinfo() {
	}

	/** full constructor */
	public Ccinfo(String stime, String etime, String addr, String uid) {
		this.stime = stime;
		this.etime = etime;
		this.addr = addr;
		this.uid = uid;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getStime() {
		return this.stime;
	}

	public void setStime(String stime) {
		this.stime = stime;
	}

	public String getEtime() {
		return this.etime;
	}

	public void setEtime(String etime) {
		this.etime = etime;
	}

	public String getAddr() {
		return this.addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getUid() {
		return this.uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

}