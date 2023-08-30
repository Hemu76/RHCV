package rhcv;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class Mapper2 implements RowMapper<Gst> {
	public Gst mapRow(ResultSet rs, int i) throws SQLException {

		Gst mc = new Gst();
		mc.setGst(rs.getDouble(1));
		return mc;
	}

}
