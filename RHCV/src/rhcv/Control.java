package rhcv;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class Control {
	Dao dc;

	@Autowired
	public Control(Dao dc) {
		this.dc = dc;
	}

	@RequestMapping(value = "/first", method = RequestMethod.GET)
	public String data(Model mm) {
		ArrayList<Product> al = dc.data();
		mm.addAttribute("adata", al);
		return "Home";
	}

	@RequestMapping(value = "/gett", method = RequestMethod.GET)
	@ResponseBody
	public String gett(Response rpp, Model mm) {
		System.out.println("hiiiiiii");
		Product price = dc.getPrice(rpp.getPname());
		Gst gsp = dc.getGst(price.getHsnCode());
		System.out.println(price.getPrice() + " " + gsp);
		int cc = Integer.parseInt(rpp.getPcount());
		double tt = price.getPrice() + (gsp.getGst() * price.getPrice()) / 100;
		mm.addAttribute("tp", tt * cc);

		return tt * cc + "";
	}

	@RequestMapping(value = "/presp", method = RequestMethod.GET)
	@ResponseBody
	public void presp(RespPay rpp) {
		System.out.println("hiiiiiii");
		String data = rpp.getPid();
		dc.setdata(data);

	}
}