package com.nkxgen.spring.orm.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "hrms_adminusers")

public class Admin {
	@Id

	private int ausr_id;
	private String ausr_name;
	private int ausr_empl_id;
	private String ausr_empl_jbgr;
	private String ausr_email;
	private String ausr_password;

	public Admin() {
		// Default constructor
	}

	public Admin(int userId, String userName, int employeeId, String employeeJobGrade, String userEmail,
			String userPassword) {
		this.setAusr_id(userId);
		this.setAusr_name(userName);
		this.setAusr_empl_id(employeeId);
		this.setAusr_empl_jbgr(employeeJobGrade);
		this.setAusr_email(userEmail);
		this.setAusr_password(userPassword);
	}

	public int getAusr_id() {
		return ausr_id;
	}

	public void setAusr_id(int ausr_id) {
		this.ausr_id = ausr_id;
	}

	public String getAusr_name() {
		return ausr_name;
	}

	public void setAusr_name(String ausr_name) {
		this.ausr_name = ausr_name;
	}

	public int getAusr_empl_id() {
		return ausr_empl_id;
	}

	public void setAusr_empl_id(int ausr_empl_id) {
		this.ausr_empl_id = ausr_empl_id;
	}

	public String getAusr_empl_jbgr() {
		return ausr_empl_jbgr;
	}

	public void setAusr_empl_jbgr(String ausr_empl_jbgr) {
		this.ausr_empl_jbgr = ausr_empl_jbgr;
	}

	public String getAusr_email() {
		return ausr_email;
	}

	public void setAusr_email(String ausr_email) {
		this.ausr_email = ausr_email;
	}

	public String getAusr_password() {
		return ausr_password;
	}

	public void setAusr_password(String ausr_password) {
		this.ausr_password = ausr_password;
	}

	// Getters and Setters

}
