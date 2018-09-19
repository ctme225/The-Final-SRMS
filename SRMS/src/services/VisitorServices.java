package services;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.dao.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.BookingDAO;
import dao.LocationDAO;
import dao.VisitorDAO;
import model.BookingModel;
import model.LocationModel;
import model.VisitorsModel;

@Controller
public class VisitorServices {

	
	@RequestMapping(value = "/landing", method = RequestMethod.GET)
	public String LandingPage() {
		return "LandingPage";
	}

	@RequestMapping(value = "/error", method = RequestMethod.GET)
	public String errorPage() {
		return "error";
	}

	@RequestMapping(value = "/welcomegreetingview", method = RequestMethod.GET)
	public String GreetingPage() {
		return "WelcomeGreetingView";
	}

	@RequestMapping(value = "/guestfarewellview", method = RequestMethod.GET)
	public String FarewellPage() {
		return "GuestFarewellView";
	}

	@RequestMapping(value = "/visitor", method = RequestMethod.GET)
	public ModelAndView ShowAllVisitors(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		
		LocationModel lm = new LocationDAO().getLocation((Integer)request.getSession().getAttribute("userLocViewId"));
		String location = lm.getLocName() + "-"+lm.getLocCity()+","+lm.getLocState();
		model.addAttribute("myLocation",location);
		model.addAttribute("mylocationmodel",lm);
		
		String user = (String)request.getSession().getAttribute("name");
		model.addAttribute("myUser", user);
		
		int loco = (Integer)request.getSession().getAttribute("userLocViewId");
		
		List<VisitorsModel> list = new VisitorDAO().getAllVisitors();
		model.addAttribute("allvis", list);
		return new ModelAndView("allVisitors", "command", new VisitorsModel());
	}

	@RequestMapping(value = "/registerVisitor", method = RequestMethod.GET)
	public ModelAndView registrationPage() {

		return new ModelAndView("VisitorRegistrationView", "command", new VisitorsModel());
	}

	@RequestMapping(value = "/checkin", method = RequestMethod.GET)
	public ModelAndView insertVisitor() {

		return new ModelAndView("CheckInView", "command", new VisitorsModel());
	}

	@RequestMapping(value = "/returncheckinview", method = RequestMethod.GET)
	public ModelAndView insertReturnVisitor() {
		return new ModelAndView("ReturnCheckInView", "command", new VisitorsModel());
	}

	@RequestMapping(value = "/checkout", method = RequestMethod.GET)
	public ModelAndView outVisitor() {
		return new ModelAndView("CheckOutView", "command", new VisitorsModel());
	}

	@RequestMapping(value = "/checkoutconfirm", method = RequestMethod.GET)
	public ModelAndView confirmoutVisitor() {
		return new ModelAndView("CheckOutConfirmView", "command", new VisitorsModel());
	}

	@RequestMapping(value = "CheckIn", method = RequestMethod.POST)
	public ModelAndView inVisitor(HttpServletRequest request, HttpServletResponse res, ModelMap bookingData) {
		try {
			List<BookingModel> listofBookings = new BookingDAO().getBookingsForCurrentDate();

			VisitorsModel obj = new VisitorDAO().getVisitorWithEmail((request.getParameter("visEmail")));
			// HttpSession userSession = request.getSession(true);
			// userSession.setAttribute("mapofBookings", listofBookings);

			System.out.println(obj.getBadgeId());
			
			// ModelMap bookingData = new ModelMap();
			bookingData.addAttribute("listofbookings", listofBookings);
			System.out.println(listofBookings.size());
			;
			return new ModelAndView("ReturnCheckInView", "command", obj);

		} catch (EmptyResultDataAccessException ex) {
			List<BookingModel> listofBookings = new BookingDAO().getBookingsForCurrentDate();

			// HttpSession userSession = request.getSession(true);
			// userSession.setAttribute("mapofBookings", listofBookings);

			// ModelMap bookingData = new ModelMap();
			bookingData.addAttribute("listofbookings", listofBookings);
			System.out.println(listofBookings.size());
			;
			return new ModelAndView("VisitorRegistrationView", "command", new VisitorsModel());
		}

	}

	@RequestMapping(value = "CheckOut", method = RequestMethod.POST)
	public ModelAndView outVisitor(HttpServletRequest request, HttpServletResponse res) {
		VisitorsModel obj = new VisitorDAO().getVisitorWithEmail((request.getParameter("visEmail")));
		return new ModelAndView("ConfirmCheckoutView", "command", obj);
	}

	@RequestMapping(value = "saveVisitor", method = RequestMethod.POST)
	public ModelAndView saveVisitor(@ModelAttribute("vis") VisitorsModel vis) {
		System.out.println(vis.getBadgeId());
		int ret = new VisitorDAO().insertVisitor(vis);
		if (ret > 0)
			return new ModelAndView("redirect:/welcomegreetingview");
		else
			return new ModelAndView("error");
	}

	@RequestMapping(value = "outVisitor", method = RequestMethod.POST)
	public ModelAndView outVisitor(@ModelAttribute("obj") VisitorsModel obj) {
		System.out.println("   " + obj.getVisEmail());
		int ret = new VisitorDAO().outVisitor(obj);
		if (ret > 0)
			return new ModelAndView("redirect:/guestfarewellview");
		else
			return new ModelAndView("error");
	}

	@RequestMapping(value="CheckOutVis/{visId}")
    public ModelAndView CheckOutVis(@PathVariable int visId)
    {
        int ret = new VisitorDAO().CheckOutVis(visId);
        if(ret>0)
            return new ModelAndView("redirect:/visitor");
        else
            return new ModelAndView("error");
    }
	/*
	 * public static void main(String args[]) {
	 * 
	 * List<VisitorsModel> list = new VisitorDAO().getAllVisitors();
	 * for(VisitorsModel v : list) { System.out.println(v.toString()); } }
	 * 
	 */
}
