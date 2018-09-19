package services;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.ArrayList;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.LocationDAO;
import dao.UserDAO;
import model.*;
import queries.LoginQueries;

@Controller
public class myservices {
	
	/**
	 * The service method called on the main index page.
	 * @return The login.jsp view.
	 */
	@RequestMapping(value = "/", method=RequestMethod.GET)
	public String homeScreen(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().invalidate();
		return "login";
	}

	/**
	 * The service method called when the logout page is reached.
	 * @return The login.jsp view.
	 */
	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().invalidate();
		return "login";
	}
	
	/**
	 * Service method called when user clicks home icon in corner
	 * @return the dashboard.jsp/dashboardNotAdmin.jsp
	 */
	@RequestMapping(value = "/home")
	public String home(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		LocationModel lm = new LocationDAO().getLocation((Integer)request.getSession().getAttribute("userLocViewId"));
		String location = lm.getLocName() + "-"+lm.getLocCity()+","+lm.getLocState();
		model.addAttribute("myLocation",location);
		model.addAttribute("mylocationmodel",lm);
		
		String user = (String)request.getSession().getAttribute("name");
		model.addAttribute("myUser", user);
		if(request.getSession().getAttribute("userType")=="Admin")
		{
			System.out.println("Inside Admin statement");
			return "dashboard";
		}
		else
		{
			System.out.println("Inside not admin");
			return "dashboardNotAdmin";
		}
		
	}
	
	/**
	 * The service method called when the dashboard page is reached.
	 * @return the dashboard.jsp view.
	 */
	@RequestMapping(value = "/dashboard")
	public String dashBoard(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		LocationModel lm = new LocationDAO().getLocation((Integer)request.getSession().getAttribute("userLocViewId"));
		String user = (String)request.getSession().getAttribute("name");
		String location = lm.getLocName() + "-"+lm.getLocCity()+","+lm.getLocState();
		model.addAttribute("myUser", user);
		model.addAttribute("myLocation",location);
		model.addAttribute("mylocationmodel",lm);
		if(request.getSession().getAttribute("userType")=="Admin")
		{
			System.out.println("Inside Admin statement");
			return "dashboard";
		}
		else
		{
			System.out.println("Inside not admin");
			return "dashboardNotAdmin";
		}
		
	}
	
	/**
	 * The service method called when the loginOnUserName page is reached.
	 * Retrieves an entered username and password and utilizes {@link LoginQueries} functions.
	 * @param request used to request and store information
	 * @param response
	 * @return If login is correct, returns a redirect to dashboard.jsp. If login is incorrect, returns the loginfailed.jsp view.
	 */
	@RequestMapping(value = "/loginOnUserName", method = RequestMethod.POST)
	public String loginOnUserName(HttpServletRequest request, HttpServletResponse response, ModelMap model) 
	{
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		LoginQueries login = new LoginQueries();
		
		System.out.println("outside try");
		try {
			UsersModel user = new LoginQueries().loginOnUserName(userName, password);
			System.out.println("before if statement");
			if ( user != null && new LoginQueries().checkIsAdminUsingUsername(userName, password)) {
				System.out.println("inside if statement");
				int userId = login.getUserIdOnUserNameandPassword(userName, password);
				request.getSession().setAttribute("userName", userName);
				request.getSession().setAttribute("userId", userId);
				request.getSession().setAttribute("userType", "Admin");
				request.getSession().setAttribute("userLocViewId",user.getLocId());
				request.getSession().setAttribute("name", user.getName());
				model.addAttribute("myUser", user.getName());
				System.out.println("CHECKPOINT 2");
				return "redirect:/dashboard";
				
			}else if(user != null && new LoginQueries().checkIsAdminUsingUsername(userName, password)==false) {
				System.out.println("inside else statement");
				int userId = login.getUserIdOnUserNameandPassword(userName, password);
				request.getSession().setAttribute("userName", userName);
				request.getSession().setAttribute("userId", userId);
				request.getSession().setAttribute("userType", "Standard");
				request.getSession().setAttribute("userLocViewId",user.getLocId());
				request.getSession().setAttribute("name", user.getName());
				model.addAttribute("myUser", user.getName());
				return "dashboardNotAdmin";
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("--------" + e);
			
			return "loginfailed";
		}
		
		return "loginfailed";
	}

	@RequestMapping(value = "/user")
    public String useroptions(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		
		LocationModel lm = new LocationDAO().getLocation((Integer)request.getSession().getAttribute("userLocViewId"));
		String loco = lm.getLocName() + "-"+lm.getLocCity()+","+lm.getLocState();
		model.addAttribute("myLocation",loco);
		model.addAttribute("mylocationmodel",lm);
		
		String userdata = (String)request.getSession().getAttribute("name");
		model.addAttribute("myUser", userdata);
		
        int userid = (Integer)request.getSession().getAttribute("userId");
        UsersModel user = new UserDAO().getUser(userid);
        LocationModel location = new LocationDAO().getLocationwithID(user.getLocId());
        List<LocationModel> allLoc = new LocationDAO().getAllLocations();
        model.addAttribute("userLocation", location.getLocName()+"-" + location.getLocCity() + "," + location.getLocState());
        model.addAttribute("userInfo", user);
        model.addAttribute("allLocation", allLoc);
        return "useroptions";
    }
	
	@RequestMapping(value = "/updateUserOptions")
    public ModelAndView updateUserOptions(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
        int userid = (Integer)request.getSession().getAttribute("userId");
        String selectedLocation = request.getParameter("selectedLocation");
        
        List<String> locSplit = Arrays.asList(selectedLocation.split("-"));
        String locName = locSplit.get(0);
        List<String> newLocSplit = Arrays.asList(locSplit.get(1).split(","));
        String locCity = newLocSplit.get(0);
        String locState = newLocSplit.get(1);
        int loc = new LocationDAO().getLocIdWithAddress(locName, locCity, locState).getLocId();
        request.getSession().setAttribute("userLocViewId", loc);
        UserModel user = new UserModel();
        user.setUserId(userid);
        user.setLocId(loc);
        user.setUserEmail(request.getParameter("userEmail"));
        user.setUserPassword(request.getParameter("userPass"));
        user.setUserName(request.getParameter("userName"));
        user.setUserPhone(request.getParameter("userPhone"));
        new UserDAO().updateUser(user);
        return new ModelAndView("redirect:/user");
    }
	@RequestMapping(value = "/usernotadmin")
    public String useroptionsnotadmin(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		
		LocationModel lm = new LocationDAO().getLocation((Integer)request.getSession().getAttribute("userLocViewId"));
		String loco = lm.getLocName() + "-"+lm.getLocCity()+","+lm.getLocState();
		model.addAttribute("myLocation",loco);
		model.addAttribute("mylocationmodel",lm);
		
		String userdata = (String)request.getSession().getAttribute("name");
		model.addAttribute("myUser", userdata);
		
        int userid = (Integer)request.getSession().getAttribute("userId");
        UsersModel user = new UserDAO().getUser(userid);
        LocationModel location = new LocationDAO().getLocationwithID(user.getLocId());
        List<LocationModel> allLoc = new LocationDAO().getAllLocations();
        model.addAttribute("userLocation", location.getLocName()+"-" + location.getLocCity() + "," + location.getLocState());
        model.addAttribute("userInfo", user);
        model.addAttribute("allLocation", allLoc);
        return "useroptionsnotadmin";
    }
	
	@RequestMapping(value = "/updateUserOptionsnotadmin")
    public ModelAndView updateUserOptionsnotadmin(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
        int userid = (Integer)request.getSession().getAttribute("userId");
        String selectedLocation = request.getParameter("selectedLocation");
        
        List<String> locSplit = Arrays.asList(selectedLocation.split("-"));
        String locName = locSplit.get(0);
        List<String> newLocSplit = Arrays.asList(locSplit.get(1).split(","));
        String locCity = newLocSplit.get(0);
        String locState = newLocSplit.get(1);
        int loc = new LocationDAO().getLocIdWithAddress(locName, locCity, locState).getLocId();
        request.getSession().setAttribute("userLocViewId", loc);
        UserModel user = new UserModel();
        user.setUserId(userid);
        user.setLocId(loc);
        user.setUserEmail(request.getParameter("userEmail"));
        user.setUserPassword(request.getParameter("userPass"));
        user.setUserName(request.getParameter("userName"));
        user.setUserPhone(request.getParameter("userPhone"));
        new UserDAO().updateUser(user);
        return new ModelAndView("redirect:/usernotadmin");
    }
}

