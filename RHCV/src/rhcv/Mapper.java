package rhcv;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class Mapper implements RowMapper<Product> {
	public Product mapRow(ResultSet rs, int i) throws SQLException {

		Product mc = new Product();
		mc.setProductName(rs.getString(1));
		return mc;
	}

}