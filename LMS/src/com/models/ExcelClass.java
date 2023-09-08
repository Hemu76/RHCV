package com.models;

import java.io.IOException;
import java.util.List;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ExcelClass {

	public static Workbook generateExcel(List<LoanApplication> loanApplicants) throws IOException {
		Workbook workbook = new XSSFWorkbook();
		Sheet sheet = workbook.createSheet("Loan Applicants");

		// Create header row
		Row headerRow = sheet.createRow(0);
		headerRow.createCell(0).setCellValue("lnap id");
		headerRow.createCell(1).setCellValue("lnap cust id");
		headerRow.createCell(2).setCellValue("lnap ap date");
		headerRow.createCell(3).setCellValue("lnap lnty id");
		headerRow.createCell(4).setCellValue("lnap amt");
		headerRow.createCell(5).setCellValue("lnap emi");
		headerRow.createCell(6).setCellValue("lnap nomreq");
		headerRow.createCell(7).setCellValue("lnap cibil score");
		headerRow.createCell(8).setCellValue("lnap status");
		headerRow.createCell(9).setCellValue("lnap con remarks");
		headerRow.createCell(10).setCellValue("lnap processed user");
		headerRow.createCell(11).setCellValue("lnap pro date");

		int rowNum = 1;
		for (LoanApplication applicant : loanApplicants) {
			Row row = sheet.createRow(rowNum++);
			row.createCell(0).setCellValue(applicant.getLnap_id());
			row.createCell(1).setCellValue(applicant.getLnap_cust_id());
			row.createCell(2).setCellValue(applicant.getLnap_apdate());
			row.createCell(3).setCellValue(applicant.getLnap_lnty_id().doubleValue());
			row.createCell(4).setCellValue(applicant.getLnap_amount());
			row.createCell(5).setCellValue(applicant.getLnap_emi());
			row.createCell(6).setCellValue(applicant.getLnap_nom_requested());
			row.createCell(7).setCellValue(applicant.getLnap_cibil_Score());
			row.createCell(8).setCellValue(applicant.getLnap_status());
			row.createCell(9).setCellValue(applicant.getLnap_conclusion_remarks());
			row.createCell(10).setCellValue(applicant.getLnap_processed_user());
			row.createCell(11).setCellValue(applicant.getLnap_processed_Date());

		}

		return workbook;
	}
}
