package rhcv;

import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

public class Daoo implements Dao {
	JdbcTemplate jt;
	Response rp;
	Product p;

	@Autowired
	public Daoo(DataSource ds) {
		jt = new JdbcTemplate(ds);
	}

	@Override
	public ArrayList<Product> data() {
		return (ArrayList<Product>) jt.query("select product_name from RHCVProduct ", new Mapper());
	}

	public Product getPrice(String name) {
		System.out.println(name);
		return (Product) jt.queryForObject("select price,hsn_code from RHCVProduct where product_name='" + name + "'",
				new Mapper1());
	}

	public Gst getGst(String hsn) {
		System.out.println(hsn);
		return (Gst) jt.queryForObject("select gst from RHCVGst where hsn_code='" + hsn + "'", new Mapper2());
	}

	public void setdata(String hsn) {
		System.out.println(hsn);
		jt.update("insert ");
	}

}
