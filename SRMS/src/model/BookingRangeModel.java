package model;

import java.sql.Timestamp;

public class BookingRangeModel {
	private Timestamp startTime;
	private Timestamp endTime;

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

	@Override
	public String toString() {
		return "BookingRangeModel [startTime=" + startTime + ", endTime=" + endTime + "]";
	}


}
