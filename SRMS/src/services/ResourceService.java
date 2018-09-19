package services;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.*;
import model.*;

@Controller
public class ResourceService {

	@RequestMapping(value="/res/{locid}", method=RequestMethod.GET)
	public ModelAndView ResourceTypeService(@PathVariable int locid, HttpServletRequest request, HttpServletResponse response, ModelMap modelList)
	{
    	LocationModel lm = new LocationDAO().getLocation((Integer)request.getSession().getAttribute("userLocViewId"));
		String location = lm.getLocName() + "-"+lm.getLocCity()+","+lm.getLocState();
		modelList.addAttribute("myLocation",location);
		modelList.addAttribute("mylocationmodel",lm);
		String user = (String)request.getSession().getAttribute("name");
		modelList.addAttribute("myUser", user);
		
		LocationDAO locdao = new LocationDAO();
		LocationModel loc = locdao.getLocation(locid);
		modelList.addAttribute("thisLoc", loc);
		List<LocationModel> allLoc = locdao.getAllLocations();
		ResourceTypeDAO resTypedao =  new ResourceTypeDAO();
		
		List<ResourceTypeModel> list = resTypedao.getResourceTypesWithLocId(loc.getLocId());
	
		
		
		ResourceDAO resdao = new ResourceDAO();
		FeatureDAO feadao = new FeatureDAO();
		ResourceFeatureDAO resfeadao = new ResourceFeatureDAO();
		
		
		for(ResourceTypeModel resType : list) {
			List<ResourceModel>  resList = resdao.getResourcesWithLocIDandResTypeID(loc.getLocId(), resType.getID());
			modelList.addAttribute("res" + resType.getName().toString(), resList);
			for(ResourceModel res : resList) {
				if(res.getIsActive() == 1){
					Integer resID =  res.getResId();
					List<ResourceFeatureModel> resFeaList = resfeadao.getResourceFeatureWithResId(res.getResId());				
					modelList.addAttribute("resfea" + resID.toString(), resFeaList);
				}
				else {
					//resList.remove(res);
				}
			}
			
		}
		
		List<FeatureModel> allFea = feadao.getAllFeatures();
		Map<Integer, FeatureModel> feaMap = new HashMap<>();
		
		for(FeatureModel feature : allFea) {
			feaMap.put(feature.getFeaId(), feature);
		}
		
		modelList.addAttribute("feaMap", feaMap);
		
		
		modelList.addAttribute("allFea", allFea);
		
		List<ResourceTypeModel> allResTypes = resTypedao.getAllResourceTypes();
		modelList.addAttribute("allResTypes", allResTypes);
		
		
		modelList.addAttribute("resourceTypes", list);
		modelList.addAttribute("allLoc", allLoc);
		return new ModelAndView("resources","command", new LocationModel());
	}
	
	
	
	/*@RequestMapping(value="/{locid}", method=RequestMethod.GET)
	public String ResourceTypeLocationChange(@PathVariable int locid, ModelMap modelList)
	{
		LocationDAO locdao = new LocationDAO();
		LocationModel loc = locdao.getLocation(locid);
		List<LocationModel> allLoc = locdao.getAllLocations();
		ResourceTypeDAO resTypedao =  new ResourceTypeDAO();
		List<ResourceTypeModel> list = resTypedao.getResourceTypesWithLocId(loc.getLocId());
		
		
		
		ResourceDAO resdao = new ResourceDAO();
		FeatureDAO feadao = new FeatureDAO();
		ResourceFeatureDAO resfeadao = new ResourceFeatureDAO();
		
		
		for(ResourceTypeModel resType : list) {
			List<ResourceModel>  resList = resdao.getResourcesWithLocIDandResTypeID(loc.getLocId(), resType.getID());
			modelList.addAttribute("res" + resType.getName().toString(), resList);
			for(ResourceModel res : resList) {
				if(res.getIsActive() == 1){
					Integer resID =  res.getResId();
					List<ResourceFeatureModel> resFeaList = resfeadao.getResourceFeatureWithResId(res.getResId());				
					modelList.addAttribute("resfea" + resID.toString(), resFeaList);
				}
				else {
					resList.remove(res);
				}
			}
			
		}
		
		List<FeatureModel> allFea = feadao.getAllFeatures();
		Map<Integer, FeatureModel> feaMap = new HashMap<>();
		
		for(FeatureModel feature : allFea) {
			feaMap.put(feature.getFeaId(), feature);
		}
		
		modelList.addAttribute("feaMap", feaMap);
		
		
		modelList.addAttribute("allFea", allFea);
		
		List<ResourceTypeModel> allResTypes = resTypedao.getAllResourceTypes();
		modelList.addAttribute("allResTypes", allResTypes);
		
		modelList.addAttribute("thisloc", loc);
		modelList.addAttribute("resourceTypes", list);
		modelList.addAttribute("allLoc", allLoc);
		return "resources";
	}*/
	
	@RequestMapping(value="/deleteResource/{resid}/{locid}", method=RequestMethod.GET)
	public ModelAndView ResourceDelete(@PathVariable int resid,
			@PathVariable int locid,
			ModelMap modelList)
	{
		System.out.println("starting delete");
		ResourceDAO resdao = new ResourceDAO();
		ResourceModel delres = resdao.getResource(resid);
		resdao.deleteResource(delres);
		System.out.println("finish delete");
		return new ModelAndView("redirect:/res/" + locid);
	}

	@RequestMapping(value="/editResource/{resid}/{locid}", method=RequestMethod.POST)
	public ModelAndView ResourceEdit(@PathVariable int resid, 
			@PathVariable int locid, 
			@RequestParam("editnameinput") String resName,
			@RequestParam("editroomnumselect") int roomNum,
			@RequestParam("editrestypeselect") int resTypeId,
			@RequestParam("editdescinput") String description,
			@RequestParam(value = "editissuper", required = false) String isSuper,
			ModelMap modelList)
	{
		
		ResourceModel editRes = new ResourceModel();
		ResourceDAO editResdao = new ResourceDAO();
		
		if(isSuper == null) {
			editRes.setAcceptedRole(0);
		}
		else {
			editRes.setAcceptedRole(1);
		}
		
		editRes.setResId(resid);
		editRes.setDescription(description);
		editRes.setIsActive(1);
		editRes.setResName(resName);
		editRes.setResType(resTypeId);
		editRes.setRoomNumber(roomNum);
		editRes.setStatus("free");
		
		editResdao.updateResource(editRes);
		
		return new ModelAndView("redirect:/res/" + locid);
	}
	
	
	@RequestMapping(value="/addResource", method=RequestMethod.POST)
	public ModelAndView ResourceAdd(
			@RequestParam("nameinput") String resName,
			@RequestParam("roomnumselect") int roomNum,
			@RequestParam("locationselect") int locId,
			@RequestParam("restypeselect") int resTypeId,
			@RequestParam("feaselect") int feaId,
			@RequestParam("descinput") String description,
			@RequestParam(value = "issuper", required = false) String isSuper,
			@RequestParam("quantselect") int quant,
			ModelMap modelList)
	{
		
		ResourceModel newRes = new ResourceModel();
		ResourceFeatureModel newResFea = new ResourceFeatureModel();
		ResourceDAO newResdao = new ResourceDAO();
		ResourceFeatureDAO newResFeadao = new ResourceFeatureDAO();
		
		
		
		if(isSuper == null) {
			newRes.setAcceptedRole(0);
		}
		else {
			newRes.setAcceptedRole(1);
		}
		
		newRes.setDescription(description);
		newRes.setIsActive(1);
		newRes.setResName(resName);
		newRes.setResType(resTypeId);
		newRes.setRoomNumber(roomNum);
		newRes.setStatus("free");
		
		
		int newResId = newResdao.insertResource(newRes, locId);		
		newResFeadao.insertResourceFeatureWith(feaId, newResId, quant, " ");
		
		
		
		return new ModelAndView("redirect:/res/" + locId);
	}
	
	@RequestMapping(value="/addFeature/{resid}/{locid}", method=RequestMethod.POST)
	public ModelAndView AddFeature(@PathVariable int resid,
			@PathVariable int locid,
			@RequestParam("addfeaselect") int feaId,
			@RequestParam("addquantselect") int quant,
			ModelMap modelList) {
		
		ResourceFeatureDAO newFea = new ResourceFeatureDAO();
		
		newFea.insertResourceFeatureWith(feaId, resid, quant, " ");
		
		return new ModelAndView("redirect:/res/" + locid);
	}
	
	@RequestMapping(value="/deleteFeature/{resfeaid}/{locid}", method=RequestMethod.POST)
	public ModelAndView DeleteFeature(@PathVariable int resfeaid,
			@PathVariable int locid,
			ModelMap modelList) {
		
		ResourceFeatureDAO delFeadao = new ResourceFeatureDAO();
		ResourceFeatureModel rfm = delFeadao.getResourceFeature(resfeaid);
		
		delFeadao.deleteResourceFeature(rfm);
		
		return new ModelAndView("redirect:/res/" + locid);
	}
	
	
}
