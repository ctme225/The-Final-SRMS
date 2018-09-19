package services;

import java.sql.Timestamp;

public class CalendarEventServices {
	
	private String roomName;
	private Timestamp startTime;
	private Timestamp endTime;
	private String color;
	private String description;
	private int bookingId;
	private String resName;
	
	public CalendarEventServices(String roomName, Timestamp startTime, Timestamp endTime, String color, String description, int id, String resName) {
		this.roomName = roomName;
		this.startTime = startTime;
		this.endTime = endTime;
		this.color = color;
		this.description = description;
		this.bookingId = id;
		this.resName = resName;
	}
	
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
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
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getBookingId() {
		return bookingId;
	}

	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}

	public String getResName() {
		return resName;
	}

	public void setResName(String resName) {
		this.resName = resName;
	}

}
