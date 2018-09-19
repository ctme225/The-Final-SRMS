package model;

import java.sql.Timestamp;

public class EmailModel {
	
	private String loction;
	private String resource;
	private Timestamp startTime;
	private Timestamp endTime;
	
	public EmailModel(String location, String resource, Timestamp startTime, Timestamp endTime) {
		this.loction = location;
		this.startTime = startTime;
		this.endTime = endTime;
		this.resource = resource;
	}
	
	public String getLoction() {
		return loction;
	}
	public void setLoction(String loction) {
		this.loction = loction;
	}
	public String getResource() {
		return resource;
	}
	public void setResource(String resource) {
		this.resource = resource;
	}
	public Timestamp getStartTime() {
		return startTime;
	}
	public void setStartTime(Timestamp startTime) {
		this.startTime = startTime;
	}
	public Timestamp getEndTime() {
		return endTime;
	}
	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}

}
