package hpharmacy;

import java.math.BigDecimal;
import java.util.Date;

public class PharmacyRecord {

	private int serialNumber;
	private String medicine;
	private String batchNumber;
	private Date expiryDate;
	private BigDecimal price;

	public PharmacyRecord() {

	}

	public int getSerialNumber() {
		return serialNumber;
	}

	public void setSerialNumber(int serialNumber) {
		this.serialNumber = serialNumber;
	}

	public String getMedicine() {
		return medicine;
	}

	public void setMedicine(String medicine) {
		this.medicine = medicine;
	}

	public String getBatchNumber() {
		return batchNumber;
	}

	public void setBatchNumber(String batchNumber) {
		this.batchNumber = batchNumber;
	}

	public Date getExpiryDate() {
		return expiryDate;
	}

	public void setExpiryDate(Date expiryDate) {
		this.expiryDate = expiryDate;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "PharmacyRecord [serialNumber=" + serialNumber + ", medicine=" + medicine + ", batchNumber="
				+ batchNumber + ", expiryDate=" + expiryDate + ", price=" + price + "]";
	}
}
