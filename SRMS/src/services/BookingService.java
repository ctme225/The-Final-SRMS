package services;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import dao.*;
import model.*;
import mapper.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@SessionAttributes("user")
public class BookingService {


    @RequestMapping(value="/util",method=RequestMethod.GET)
    public String utilization(ModelMap modelList,HttpServletRequest req,HttpServletResponse res)
    {

    	LocationModel lm = new LocationDAO().getLocation((Integer)req.getSession().getAttribute("userLocViewId"));
		String location = lm.getLocName() + "-"+lm.getLocCity()+","+lm.getLocState();
		modelList.addAttribute("myLocation",location);
		modelList.addAttribute("mylocationmodel",lm);
		String user = (String)req.getSession().getAttribute("name");
		modelList.addAttribute("myUser", user);
        // Grab locations
        // Grab Rooms
        BookingDAO dao = new BookingDAO();
        LocationDAO ldao = new LocationDAO();
        int locid = (Integer)req.getSession().getAttribute("userLocViewId");
        if(locid == 0) locid = 1;
        System.out.println(locid);
        List<ChartData> list = dao.getNumberBookingPerDay(locid);
        //list.sort(Comparator.comparing(ChartData::getNumDays).reversed());
        for(ChartData i : list)
        {
            System.out.println(i.getTitle()+" "+i.getNumDays());

        }
        if(!modelList.containsAttribute("pieData"))
            modelList.addAttribute("pieData",new ArrayList<ChartData>());
        modelList.addAttribute("chartData",list);
        List<LocationModel> locations = ldao.getAllLocations();
        modelList.addAttribute("locations",locations);
        return "util";
    }

    @RequestMapping(value="setDefaults/{location}/{timeframe}")
    public String utilLocationChange(ModelMap map,HttpServletRequest req,HttpServletResponse res,@PathVariable("location") int location,@PathVariable("timeframe")int timeframe)
    {
        if(location != 0)
            req.getSession().setAttribute("userLocViewId",location);
        if(timeframe != 0)
            req.getSession().setAttribute("userTimeScale",timeframe);
        return "redirect:/util";
    }

    @RequestMapping(value="Utilization/{resource}")
    public ModelAndView utilization2(ModelMap modelList, @PathVariable("resource") String resName, RedirectAttributes redir,HttpServletRequest req,HttpServletResponse res)
    {
        // Grab locations
        // Grab Rooms

        modelList.addAttribute("location",new LocationModel());
        BookingDAO dao = new BookingDAO();
        int locid = (Integer)req.getSession().getAttribute("userLocViewId");
        List<ChartData> list = dao.getNumberBookingPerDay(locid);
        List<ChartData> list2 = dao.getNumberBookingByResourceType(resName);
        //list.sort(Comparator.comparing(ChartData::getNumDays).reversed());
        for(ChartData i : list)
        {
            System.out.println(i.getTitle()+" "+i.getNumDays());

        }
        for(ChartData i : list2)
        {
            System.out.println(i.getTitle()+" "+i.getNumDays());

        }
        modelList.addAttribute("pieData",list2);
        modelList.addAttribute("chartData",list);
        ModelAndView view = new ModelAndView("redirect:/util");
        redir.addFlashAttribute("pieData",list2);
        return view;
    }
    
    /* Add the Restful Services as well */
    private ResourceModel find(List<ResourceModel> l,List<LocationResourceModel> lr, int id)
	{
		for(LocationResourceModel model:lr)
		{
			if(id>62) System.out.println("Not found");
			if(id==model.getID())
			{
				for(ResourceModel res:l)
				{
					
					if(model.getResourceID()==res.getResId())
						return res;
				}
				
			}
		}
		ResourceModel newRes = new ResourceModel();
		return newRes;
	}
	public List<CalendarEventServices> getBookings(List<BookingModel> newBookings) {
		List<CalendarEventServices> ces = new ArrayList<>();
		ResourceDAO dao = new ResourceDAO();
		List<ResourceModel> res = dao.getAllResources();
		List<LocationResourceModel> locModel = dao.getLoccationResources();
		for(BookingModel out:newBookings) {
			ResourceModel res1 = find(res, locModel, out.getLocResID());
			String roomName = "Event";
			String color = "purple";
			//if(!res1.getResType().equalsIgnoreCase("none")) {
			switch(res1.getResType()) {
	            case 1:
	                roomName = "Scrum";
	                color = "red";
	                break;
	            case 2:
	                roomName = "Board";
	                color = "blue";
	                break;
	            case 3:
	                roomName = "Class";
	                color = "pink";
	                break;
	            case 4:
	                roomName = "Rec";
	                color = "green";
	                break;
	            case 5:
	                roomName = "Break";
	                color = "grey";
	                break;
	            case 6:
	                roomName = "Lounge";
	                color = "yellow";
	                break;
	            case 7:
	                roomName = "Conference";
	                color = "orange";
	                break;
	            default:
	                roomName = "Meeting";
	                color = "rgb(255, 80, 80)";
	        }
				CalendarEventServices c = new CalendarEventServices(roomName, out.getStartTime(), out.getEndTime(), color, out.getDescription(), out.getID(),res1.getResName());
				ces.add(c);
			//}else {
				//System.out.println(out.toString());
			//}
			
		}
		
		return ces;
	}
	
	@RequestMapping(value="/reserve",method=RequestMethod.GET)
	public ModelAndView showReservations(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
    	
		LocationModel lm = new LocationDAO().getLocation((Integer)request.getSession().getAttribute("userLocViewId"));
		String loco = lm.getLocName() + "-"+lm.getLocCity()+","+lm.getLocState();
		model.addAttribute("myLocation",loco);
		String user = (String)request.getSession().getAttribute("name");
		model.addAttribute("myUser", user);
		model.addAttribute("mylocationmodel",lm);
		
		int userLocViewId = (Integer)request.getSession().getAttribute("userLocViewId");
		if(userLocViewId == 0)
		{
			//userobj.setUserid(6);
			int userid = (Integer)request.getSession().getAttribute("userId");
			LocationModel location = new UserDAO().getUserLocation(userid);
			//userobj.setLocid(location.getLocid());
			request.getSession().setAttribute("userLocationId", location.getLocId());
			request.getSession().setAttribute("userLocViewId", location.getLocId());
			request.getSession().setAttribute("resTypeID", 1);
			List<LocationModel> allLoc = new LocationDAO().getAllLocations();
			model.addAttribute("loc", location.getLocName());
			model.addAttribute("loccity", location.getLocCity());
			model.addAttribute("locstate", location.getLocState());
			model.addAttribute("location", location);
			model.addAttribute("userid", (Integer)request.getSession().getAttribute("userId"));
			model.addAttribute("alllocations", allLoc);
			List<LocationResourceModel> locationresourceidlist = new LocationDAO().getResId(location.getLocId());
			List<BookingModel> bkg = new BookingDAO().getAllBookings();
			List<BookingModel> newBookings = new ArrayList<>();
			List<ResourceTypeModel> rtm = new ResourceTypeDAO().getResourceTypesWithLocId(location.getLocId());
			model.addAttribute("Rtypes",rtm);
			ResourceTypeModel resTypeForUSer = new ResourceTypeDAO().getResourceType((Integer)request.getSession().getAttribute("resTypeID"));
			model.addAttribute("defaultResType", resTypeForUSer.getName());
			for(LocationResourceModel lrm: locationresourceidlist) {
				for(BookingModel b:bkg) {
					if(lrm.getID() == b.getLocResID() && lrm.getIsActive() == 1) {
						newBookings.add(b);
					}
				}
			}
			List<CalendarEventServices> ces = new ArrayList<>();
			ces = getBookings(newBookings);
			model.addAttribute("bookings", ces);
			List<ResourceModel> listRes = new ResourceDAO().getResourcesWithLocIDandResTypeID((Integer)request.getSession().getAttribute("userLocViewId"), (Integer)request.getSession().getAttribute("resTypeID"));
			
            Map<Integer,List<FeatureViewModel>> features = new FeatureDAO().getFeatureMap(listRes);
            List<ResourceViewModel> rescources = new ArrayList<>();
            for (ResourceModel i:listRes) {
                ResourceViewModel rvm = new ResourceViewModel();
                rvm.setResource(i);
                rvm.setFeatures(features.get(i.getResId()));
                rescources.add(rvm);
            }
            model.addAttribute("resources",rescources);			
            model.addAttribute("ResT",resTypeForUSer.getIconName());
		}else {
			if(request.getSession().getAttribute("resTypeID")==null) {
				request.getSession().setAttribute("resTypeID", 1);
			}
			List<LocationModel> allLoc = new LocationDAO().getAllLocations();
			//int userid = (Integer)request.getSession().getAttribute("userId");
			LocationModel location = new LocationDAO().getLocationwithID((Integer)request.getSession().getAttribute("userLocViewId"));
			model.addAttribute("loc", location.getLocName());
			model.addAttribute("loccity", location.getLocCity());
			model.addAttribute("locstate", location.getLocState());
			model.addAttribute("location", location);
			model.addAttribute("userid", (Integer)request.getSession().getAttribute("userId"));
			model.addAttribute("alllocations", allLoc);
			List<LocationResourceModel> locationresourceidlist = new LocationDAO().getResId((Integer)request.getSession().getAttribute("userLocViewId"));
			List<BookingModel> bkg = new BookingDAO().getAllBookings();
			List<BookingModel> newBookings = new ArrayList<>();
			List<ResourceTypeModel> rtm = new ResourceTypeDAO().getResourceTypesWithLocId((Integer)request.getSession().getAttribute("userLocViewId"));
			model.addAttribute("Rtypes",rtm);
			for(LocationResourceModel lrm: locationresourceidlist) {
				for(BookingModel b:bkg) {
					if(lrm.getID() == b.getLocResID() && lrm.getIsActive() == 1) {
						newBookings.add(b);
					}
				}
			}
			List<CalendarEventServices> ces = new ArrayList<>();
			ces = getBookings(newBookings);
			model.addAttribute("bookings", ces);
			ResourceTypeModel resTypeForUSer = new ResourceTypeDAO().getResourceType((Integer)request.getSession().getAttribute("resTypeID"));
			model.addAttribute("defaultResType", resTypeForUSer.getName());
			
			List<ResourceModel> listRes = new ResourceDAO().getResourcesWithLocIDandResTypeID((Integer)request.getSession().getAttribute("userLocViewId"), (Integer)request.getSession().getAttribute("resTypeID"));

            Map<Integer,List<FeatureViewModel>> features = new FeatureDAO().getFeatureMap(listRes);
            List<ResourceViewModel> rescources = new ArrayList<>();
            for (ResourceModel i:listRes) {
                ResourceViewModel rvm = new ResourceViewModel();
                rvm.setResource(i);
                rvm.setFeatures(features.get(i.getResId()));
                rescources.add(rvm);
            }
            model.addAttribute("resources",rescources);			
            model.addAttribute("ResT",resTypeForUSer.getIconName());


			
		}
		return new ModelAndView("showreservations","command", new BookingMapper());
	}
	
	@RequestMapping(value="getUserLocation/{userid}",method=RequestMethod.GET)
	public String getUserLocation(Model model, @PathVariable int userid) {
		//String locName = new UserDAO().getUserLocation(61);
		//model.addAttribute("loc", locName);
		return "showreservations";
	}
	
	@RequestMapping(value="/saveReservation", method=RequestMethod.POST)
	public ModelAndView getAllBookings(HttpServletRequest req, HttpServletResponse res,ModelMap models) {
		int resid = Integer.parseInt(req.getParameter("resourceid"));
		int loc = Integer.parseInt(req.getParameter("location"));
		System.out.println(resid + " " + loc);
		BookingModel bm = new BookingModel();
		LocationResourceModel lrm = new LocationDAO().getLocationResource(resid, loc);
		bm.setDescription(req.getParameter("description"));
		bm.setIsActive(1);
		bm.setLocResID(lrm.getID());
		System.out.println(req.getParameter("occur-type"));
		bm.setUserID(Integer.parseInt(req.getParameter("useridForService")));
		System.out.println(req.getParameter("occur-type"));
		System.out.println(req.getParameter("startTimeStamp"));
		if(req.getParameter("occur-type").equals("Single Day")) {
			System.out.println("Single Day Event");
			new BookingDAO().insertBooking(bm,req.getParameter("startTimeStamp") ,req.getParameter("endTimeStamp") );
		}else {
			List<String> startTimeList = Arrays.asList(req.getParameter("startTimeStamp").split(","));
			List<String> endTimeList = Arrays.asList(req.getParameter("endTimeStamp").split(","));
			System.out.println(startTimeList.size() + " - " + endTimeList.size());
			for(int i = 0; i < startTimeList.size(); i++) {
				new BookingDAO().insertBooking(bm,startTimeList.get(i) ,endTimeList.get(i));
			}
		}
		
		//bm = ((List<BookingModel>)models.get("bookings")).get(0);
		return new ModelAndView("redirect:/reserve");
	}
	
	@RequestMapping(value="/changeLocation/{locid}", method=RequestMethod.GET)
	public ModelAndView changeToNewLocaton(@PathVariable int locid, HttpServletRequest req, HttpServletResponse res) {
		req.getSession().setAttribute("userLocViewId", locid);
		return new ModelAndView("redirect:/reserve");
	}	
	@RequestMapping(value="/changeResourceType/{restypeid}", method=RequestMethod.GET)
	public ModelAndView changeToNewResType(@PathVariable int restypeid, HttpServletRequest req, HttpServletResponse res) {
		System.out.println(restypeid);
		req.getSession().setAttribute("resTypeID", restypeid);
		return new ModelAndView("redirect:/reserve");
	}	
	
	@RequestMapping(value="/editBooking", method=RequestMethod.POST)
	public ModelAndView editBooking(HttpServletRequest req, HttpServletResponse res,ModelMap models) {
		System.out.println(req.getParameter("bookingidforedit"));
		System.out.println(req.getParameter("editStartTime"));
		System.out.println(req.getParameter("editEndTime"));
		System.out.println(req.getParameter("description-for-edit"));
		System.out.println(req.getParameter("useridforedits") + " and " + req.getSession().getAttribute("userId"));
		System.out.println(req.getParameter("locidforedit") + " and " + req.getSession().getAttribute("userLocViewId"));
		int bookingId = Integer.parseInt(req.getParameter("bookingidforedit"));
		BookingModel bm = new BookingModel();
		bm.setID(bookingId);
		bm.setDescription(req.getParameter("description-for-edit"));
		bm.setIsActive(1);
		//bm.setUserID((Integer)req.getSession().getAttribute("userId"));
		//bm.setLocResID((Integer)req.getSession().getAttribute("userLocViewId"));
		int ret = new BookingDAO().updateBooking(bm,req.getParameter("editStartTime"),req.getParameter("editEndTime"));
		System.out.println(ret);
		return new ModelAndView("redirect:/reserve");
	}
	
	@RequestMapping(value="/deleteBooking/{bookingid}", method=RequestMethod.GET)
	public ModelAndView deleteBookingService(@PathVariable int bookingid, HttpServletRequest req, HttpServletResponse res) {
		int ret = new BookingDAO().deleteBooking(bookingid);
		return new ModelAndView("redirect:/reserve");
	}	
	
	@RequestMapping(value="sendInviteEmails/{emails}", method=RequestMethod.GET)
	public ModelAndView sendInviteEmails(@PathVariable("emails") String emails,HttpServletRequest req, HttpServletResponse res) {
		System.out.println(emails);
		List<String> emailList = Arrays.asList(emails.split("~"));
		BookingModel booking = new BookingDAO().getBooking(Integer.parseInt(emailList.get(0))); //got the booking for start and end times
		String resType = new ResourceTypeDAO().getResourceType((Integer)req.getSession().getAttribute("resTypeID")).getName();//got the resource
		LocationModel locMod = new LocationDAO().getLocationwithID((Integer)req.getSession().getAttribute("userLocViewId")); //got location
		String userName = new UserDAO().getUser((Integer)req.getSession().getAttribute("userId")).getName();//got user's name
		String location = locMod.getLocName() + "  " + locMod.getLocCity() + "  " + locMod.getLocState();
		String resource = resType + " " + emailList.get(1);
		System.out.println(userName + "  " + locMod.getLocName() + "  " + locMod.getLocCity() + "  " + locMod.getLocState() + "  " + resType+ "  " + emailList.get(1) + " " + booking.getStartTime() + "  " + booking.getEndTime());
		Invite newInvite = new Invite();
		EmailModel em = new EmailModel(location, resource, booking.getStartTime(), booking.getEndTime());
		
		for(int i=2; i < emailList.size()-1; i++) {
			newInvite.sendEmail(em, emailList.get(i));
		}
		
		
		return new ModelAndView("redirect:/reserve");
	}
    
    
    
}
