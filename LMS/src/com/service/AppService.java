package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.Dao.DAOImp;
import com.models.Customer;
import com.models.LoanApplicantNominee;
import com.models.LoanApplication;

@Component
public class AppService {

	private DAOImp serv;

	@Autowired
	public AppService(DAOImp serv) {
		this.serv = serv;
	}

	@Transactional
	public void addC(Customer la) {
		serv.persist(la);
	}

	@Transactional
	public void addLa(LoanApplication la, LoanApplicantNominee ln) {
		serv.persist(la, ln);
	}

	@Transactional
	public void update(LoanApplication la) {
		serv.updaid(la);
	}

	// @Transactional
	// public void addAll(Collection<LoanApplication> laa) {
	// for (LoanApplication la : laa) {
	// serv.persist(la);
	// }
	// }

	@Transactional(readOnly = true)
	public List<LoanApplication> listAll() {
		return serv.getAllLoanApplicants();
	}
}
