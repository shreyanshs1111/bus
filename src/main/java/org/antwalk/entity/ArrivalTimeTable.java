package org.antwalk.entity;

import java.time.LocalTime;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="time")
public class ArrivalTimeTable {
	
	@EmbeddedId
	private RouteAndStop rs;
	
	@Column(name="morning_arrival_time")
	private LocalTime morningArrivalTime;
	
	@Column(name="evening_arrival_time")
	private LocalTime eveningArrivalTime;

	public RouteAndStop getRs() {
		return rs;
	}

	public void setRs(RouteAndStop rs) {
		this.rs = rs;
	}

	public LocalTime getMorningArrivalTime() {
		return morningArrivalTime;
	}

	public void setMorningArrivalTime(LocalTime morningArrivalTime) {
		this.morningArrivalTime = morningArrivalTime;
	}

	public LocalTime getEveningArrivalTime() {
		return eveningArrivalTime;
	}

	public void setEveningArrivalTime(LocalTime eveningArrivalTime) {
		this.eveningArrivalTime = eveningArrivalTime;
	}

	public ArrivalTimeTable(RouteAndStop rs, LocalTime morningArrivalTime, LocalTime eveningArrivalTime) {
		super();
		this.rs = rs;
		this.morningArrivalTime = morningArrivalTime;
		this.eveningArrivalTime = eveningArrivalTime;
	}

	public ArrivalTimeTable() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	

	
	
	
}
