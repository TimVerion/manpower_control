package com.model;

/**
 * Qd entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Qd implements java.io.Serializable {

	// Fields

	private Integer id;
	private String uid;
	private String kstime;
	private String jstime;
	private String savetime;
	private String fz;

	// Constructors

	/** default constructor */
	public Qd() {
	}

	/** full constructor */
	public Qd(String uid, String kstime, String jstime, String savetime,
			String fz) {
		this.uid = uid;
		this.kstime = kstime;
		this.jstime = jstime;
		this.savetime = savetime;
		this.fz = fz;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUid() {
		return this.uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getKstime() {
		return this.kstime;
	}

	public void setKstime(String kstime) {
		this.kstime = kstime;
	}

	public String getJstime() {
		return this.jstime;
	}

	public void setJstime(String jstime) {
		this.jstime = jstime;
	}

	public String getSavetime() {
		return this.savetime;
	}

	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}

	public String getFz() {
		return this.fz;
	}

	public void setFz(String fz) {
		this.fz = fz;
	}

}