package hpharmacy;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class Mapper implements RowMapper<PharmacyRecord> {
	public PharmacyRecord mapRow(ResultSet rs, int i) throws SQLException {
		PharmacyRecord mc = new PharmacyRecord();
		mc.setSerialNumber(rs.getInt(1));
		mc.setMedicine(rs.getString(2));
		mc.setBatchNumber(rs.getString(3));
		mc.setExpiryDate(rs.getDate(4));
		mc.setPrice(rs.getBigDecimal(5));
		return mc;
	}

}