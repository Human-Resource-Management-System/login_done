package com.nkxgen.spring.orm.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.nkxgen.spring.orm.model.Admin;
import com.nkxgen.spring.orm.model.Employee;

@Component
public class EmpDAO {

	@PersistenceContext
	private EntityManager em;

	@Transactional
	public Employee getDetailsByEmail(String emailId) {
		TypedQuery<Employee> query = em.createQuery("SELECT e FROM Employee e WHERE e.empl_offemail = :emailId",
				Employee.class);
		query.setParameter("emailId", emailId);
		return query.getSingleResult();
	}

	@Transactional
	public Admin getDetailsByEmail_admin(String emailId) {
		TypedQuery<Admin> query = em.createQuery("SELECT e FROM Admin e WHERE e.ausr_email = :emailId", Admin.class);
		query.setParameter("emailId", emailId);
		return query.getSingleResult();
	}

}