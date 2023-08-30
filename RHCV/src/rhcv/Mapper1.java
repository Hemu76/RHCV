package rhcv;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class Mapper1 implements RowMapper<Product> {
	public Product mapRow(ResultSet rs, int i) throws SQLException {

		Product mc = new Product();
		mc.setHsnCode(rs.getString(2));
		mc.setPrice(rs.getDouble(1));
		return mc;
	}

}