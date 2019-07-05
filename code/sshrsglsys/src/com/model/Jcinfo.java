package com.model;

/**
 * Jcinfo entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Jcinfo implements java.io.Serializable {

	// Fields

	private Integer id;
	private String info;
	private String type;
	private Integer uid;
	private String savatime;

	// Constructors

	/** default constructor */
	public Jcinfo() {
	}

	/** full constructor */
	public Jcinfo(String info, String type, Integer uid, String savatime) {
		this.info = info;
		this.type = type;
		this.uid = uid;
		this.savatime = savatime;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getInfo() {
		return this.info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Integer getUid() {
		return this.uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getSavatime() {
		return this.savatime;
	}

	public void setSavatime(String savatime) {
		this.savatime = savatime;
	}

}