package rhcv;

import java.util.ArrayList;

public interface Dao {
	public Gst getGst(String hsn);

	public void setdata(String hsn);

	public Product getPrice(String name);

	public ArrayList<Product> data();
}
