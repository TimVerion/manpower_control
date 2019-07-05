package com.model;

/**
 * Salary entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Salary implements java.io.Serializable {

	// Fields

	private Integer id;
	private String money;
	private String uid;
	private String month;

	// Constructors

	/** default constructor */
	public Salary() {
	}

	/** full constructor */
	public Salary(String money, String uid, String month) {
		this.money = money;
		this.uid = uid;
		this.month = month;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getMoney() {
		return this.money;
	}

	public void setMoney(String money) {
		this.money = money;
	}

	public String getUid() {
		return this.uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getMonth() {
		return this.month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

}