package dao;

import org.springframework.jdbc.core.JdbcTemplate;


import mapper.VisitorsMapper;
import model.VisitorsModel;

import java.util.List;

public class VisitorDAO {
	private JdbcTemplate temp;

	public VisitorDAO() {
		temp = Connection.getConnection();
	}
	    
    // Return the next available ID for insert
    public int getNextAvailableKey() {
    	Integer keyInc = (Integer)temp.queryForObject("select MAX(visId) from Visitor",Integer.class);
    	if(keyInc == null) 
    		return 1;
    	else
    		return keyInc+1;
    }
    
    // Return VisitorModel with specified visitorID
    public VisitorsModel getVisitor(int visId) {
    	return (VisitorsModel)temp.queryForObject("Select * from Visitor where visId = ?", new VisitorsMapper(), visId);
    }
  
    
    // Given visitor, using his email, returns visitorLog without a checkout time -- Ones where the visitor has not checked out yet
    public List<VisitorsModel> getVisitorLogNotCheckedOut(VisitorsModel vis) {
    	return temp.query("select * from Visitor where visemail = ? and checkout = null", new VisitorsMapper(), vis.getVisEmail());
    }


	// Return VisitorModel with specified visitorID
	public VisitorsModel getVisitor(String string) {
		return (VisitorsModel) temp.queryForObject("Select * from Visitor where visEmail = ?", new VisitorsMapper(),
				string);
	}

	// Given email, return corresponding visitorModel
	public VisitorsModel getVisitorWithEmail(String email) {
		return (VisitorsModel) temp.queryForObject(
				"Select * from (Select * from Visitor where visEmail = ?) " + "where rownum = 1", new VisitorsMapper(),
				email);
	}

	// Inserts specified visitor into Visitor table
	public int insertVisitor(VisitorsModel vis) {
		return temp.update("insert into Visitor values(?,?,?,?,?,?,?,sysdate,null,1,1200)", new VisitorDAO().getNextAvailableKey(), 
				vis.getVisName(),
				vis.getVisEmail(), vis.getVisPhone(), vis.getBadgeId(), vis.getVisCompany(), vis.getVisPurpose());
	}

	// Updates isActive column entry to 0 to the specified visitor from Visitor
	// table
	public int deleteVisitor(VisitorsModel vis) {
		return temp.update("update Visitor set isActive = 0 where visId = ?", vis.getVisId());
	}

	// Updates specified visitor from Visitor table
	public int updateVisitor(VisitorsModel vis) {
		return temp.update(
				"update Visitor set visName = ?, visEmail = ?, visPhone = ?, "
						+ "badgeId = ?, visPurpose = ?, visCompany = ? where visId = ?)",
				vis.getVisName(), vis.getVisEmail(), vis.getVisPhone(), vis.getBadgeId(), vis.getVisPurpose(),
				vis.getVisCompany(), new VisitorDAO().getNextAvailableKey());
	}

	// Returns a list of VisitorModel from Visitor table
	public List<VisitorsModel> getAllVisitors() {
		return temp.query("select * from visitor", new VisitorsMapper());
	}
	

	// Check out a visitor
	public int outVisitor(VisitorsModel obj) {
		return temp.update("update Visitor set checkout=sysdate where visEmail = ?",obj.getVisEmail());
	}
	
	// Check out a visitor
	public int CheckOutVis(int visId) {
		return temp.update("update Visitor set checkout=sysdate where visId = ?", visId);
	}

	/*
	public static void main(String args[]) {
		List<VisitorsModel> list = new VisitorDAO().getAllVisitors(1);
		for(VisitorsModel v : list) {
			System.out.println(v.toString());
		}
	}
	*/
}
