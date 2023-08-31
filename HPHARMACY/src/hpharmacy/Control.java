package hpharmacy;

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
		ArrayList<PharmacyRecord> al = dc.data();
		System.out.println(al.size() + "jyhgjjhg");
		mm.addAttribute("adata", al);
		return "Home";
	}

	@RequestMapping(value = "/first1", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<PharmacyRecord> data1(Resp r, Model mm) {
		ArrayList<PharmacyRecord> al = dc.data();
		String data = r.getData();
		System.out.println(data + "   Hemu");
		if (al != null) {
			for (int i = 0; i < al.size(); i++) {
				if (!data.equals(al.get(i).getMedicine())) {
					System.out.println("Hellooooo");
					al.remove(i);
					i--;
				}
			}
			System.out.println(al.size());
			mm.addAttribute("adata", al);
		}
		return al;
	}

	@RequestMapping(value = "/medicine", method = RequestMethod.GET)
	public String pop(Model mm) {
		ArrayList<PharmacyRecord> al = dc.data();
		System.out.println(al.size() + "jyhgjjhg");
		mm.addAttribute("adata", al);
		return "pop";
	}
}