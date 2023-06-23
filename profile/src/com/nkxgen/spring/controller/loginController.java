package com.nkxgen.spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.nkxgen.spring.orm.model.Admin;
import com.nkxgen.spring.orm.model.Employee;
import com.nkxgen.spring.orm.servic.EmpService;

@Controller
public class loginController {

	EmpService empserv;

	@Autowired
	public loginController(EmpService empserv, Employee empauto) {
		this.empserv = empserv;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String employeeLogin(Model model) {
		System.out.println("empLogin JSP Requested");
		return "login";
	}

	@RequestMapping(value = "/employee", method = RequestMethod.POST)
	public String enterIntoMenu_employee(@RequestParam("empl_email") String email,
			@RequestParam("empl_password") String password, HttpServletRequest request) {

		HttpSession session = request.getSession(true);
		System.out.println("thi9s isemployee side ");
		Employee empdetails = empserv.getByEmail(email);

		if (empserv.authenticateUser(email, password)) {

			// Set employee ID in session
			int employeeId = empdetails.getEmpl_id();
			session.setAttribute("employeeId", employeeId);
			return "front"; // Redirect to the dashboard page
		} else {
			return "login";
		}
	}

	@RequestMapping(value = "/admin", method = RequestMethod.POST)
	public String enterIntoMenu_admin(@RequestParam("admin_email") String email,
			@RequestParam("admin_password") String password, HttpServletRequest request) {
		System.out.println("thi9s isv admin side ");

		HttpSession session = request.getSession(true);
		Admin empdetails = empserv.getAdmin(email);

		if (empserv.authenticateUser_admin(email, password)) {

			// Set employee ID in session
			int adminId = empdetails.getAusr_empl_id();
			System.out.println(adminId);

			session.setAttribute("adminId", adminId);

			return "front"; // Redirect to the dashboard page
		} else {
			return "login";
		}
	}

	@RequestMapping(value = "/h", method = RequestMethod.GET)
	public void getAllDetailsEmploye(HttpSession session) {

		if (session.getAttribute("adminId") == null)
			System.out.println("no admin login");
		else {
			System.out.println("admin login");
			int employeeid = (int) session.getAttribute("adminId");
			System.out.println(employeeid);
		}
		if (session.getAttribute("employeeId") == null)
			System.out.println("no employee login");
		else {
			System.out.println("employee login");
			int adminid = (int) session.getAttribute("employeeId");
			System.out.println(adminid);
		}

	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public void logout(HttpSession session) {
		session.invalidate();
		System.out.println("logout");
	}
}