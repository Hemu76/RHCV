package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.models.Customer;
import com.models.ExcelClass;
import com.models.LoanApplicantNominee;
import com.models.LoanApplication;
import com.service.AppService;

@Controller
public class LMSController {

	AppService dao;

	@Autowired
	public LMSController(AppService dao) {
		this.dao = dao;
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String getAllEmployees(Model model) {

		return "login";
	}

	// @RequestMapping(value = "/sss", method = RequestMethod.GET)
	// public String save(@Validated Customer c,@Validated LoanApplication l,@Validated LoanApplicantNominee n, Model
	// model) {
	// System.out.println("hiii");
	// model.addAttribute("c",c);
	// model.addAttribute("l",l);
	// model.addAttribute("n",n);
	// return "preview";
	// }
	@RequestMapping(value = "/ld", method = RequestMethod.GET)
	public String sendLoanDetails(Model m) {
		ArrayList<LoanApplication> al = (ArrayList<LoanApplication>) dao.listAll();
		m.addAttribute("ld", al);
		return "loandetails";
	}

	@RequestMapping(value = "/ld1", method = RequestMethod.GET)
	public String sendLoanDetails1(Model m) {
		ArrayList<LoanApplication> al = (ArrayList<LoanApplication>) dao.listAll();
		m.addAttribute("ld", al);
		return "loandetails1";
	}

	@RequestMapping(value = "/ld2", method = RequestMethod.GET)
	public String sendLoanDetails2(Model m) {
		ArrayList<LoanApplication> al = (ArrayList<LoanApplication>) dao.listAll();
		m.addAttribute("ld", al);
		return "loandetails2";
	}

	@RequestMapping(value = "/savenew", method = RequestMethod.GET)
	public String saveNew(@Validated Customer c, @Validated LoanApplication l, @Validated LoanApplicantNominee n,
			Model model) {
		System.out.println(c.toString());
		System.out.println(l.toString());
		System.out.println(n.toString());
		System.out.println(1);
		dao.addC(c);
		System.out.println(2);
		l.setLnap_cust_id(c.getCust_id());
		System.out.println(c.getCust_id() + "hii");
		dao.addLa(l, n);

		System.out.println(l.getLnap_id());
		System.out.println(4);
		return "personaldetails";
	}

	@RequestMapping(value = "/id", method = RequestMethod.GET)
	public String getAppById(@Validated LoanApplication l, Model mm) {
		dao.update(l);
		ArrayList<LoanApplication> al = (ArrayList<LoanApplication>) dao.listAll();
		mm.addAttribute("ld", al);
		return "loandetails";
	}

	@RequestMapping(value = "/downloadExcel", method = RequestMethod.GET)
	public void downloadExcel(HttpServletResponse response) throws IOException {
		List<LoanApplication> lapp = dao.listAll();
		Workbook workbook = ExcelClass.generateExcel(lapp);

		// Set the response headers for Excel download
		response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
		response.setHeader("Content-Disposition", "attachment; filename=loan_applicants.xlsx");

		// Write the workbook to the response output stream
		workbook.write(response.getOutputStream());
		workbook.close();
	}
}
