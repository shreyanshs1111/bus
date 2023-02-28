package org.antwalk.entity;

import java.time.LocalTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="bus")
public class Bus {
	
	@Id
	@GeneratedValue
	@Column(name="bid")
	private long bid;
	
	@Column(name="total_seats")
	private int totalSeats;
	
	@Column(name="available_seats")
	private int availableSeats;
	
	@Column(name="start_time")
	private LocalTime startTime;
	
	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "driver_id", referencedColumnName = "did")
	private Driver d;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "bus_route", referencedColumnName = "rid")
	private Route r;

	public long getBid() {
		return bid;
	}

	public void setBid(long bid) {
		this.bid = bid;
	}

	public int getTotalSeats() {
		return totalSeats;
	}

	public void setTotalSeats(int totalSeats) {
		this.totalSeats = totalSeats;
	}

	public int getAvailableSeats() {
		return availableSeats;
	}

	public void setAvailableSeats(int availableSeats) {
		this.availableSeats = availableSeats;
	}

	public LocalTime getStartTime() {
		return startTime;
	}

	public void setStartTime(LocalTime startTime) {
		this.startTime = startTime;
	}

	public Driver getD() {
		return d;
	}

	public void setD(Driver d) {
		this.d = d;
	}

	public Route getR() {
		return r;
	}

	public void setR(Route r) {
		this.r = r;
	}

	public Bus(long bid, int totalSeats, int availableSeats, LocalTime startTime, Driver d, Route r) {
		super();
		this.bid = bid;
		this.totalSeats = totalSeats;
		this.availableSeats = availableSeats;
		this.startTime = startTime;
		this.d = d;
		this.r = r;
	}

	public Bus() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	

}
