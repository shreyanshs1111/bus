package org.antwalk.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="route")
public class Route {
	
	@Id
	@GeneratedValue
	@Column(name="rid")
	private long rid;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "start", referencedColumnName = "sid")
	private Stop start;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "end", referencedColumnName = "sid")
	private Stop end;
	
	@Column(name="active")
	private String active;

	public long getRid() {
		return rid;
	}

	public void setRid(long rid) {
		this.rid = rid;
	}

	public Stop getStart() {
		return start;
	}

	public void setStart(Stop start) {
		this.start = start;
	}

	public Stop getEnd() {
		return end;
	}

	public void setEnd(Stop end) {
		this.end = end;
	}

	public String getActive() {
		return active;
	}

	public void setActive(String active) {
		this.active = active;
	}

	public Route(long rid, Stop start, Stop end, String active) {
		super();
		this.rid = rid;
		this.start = start;
		this.end = end;
		this.active = active;
	}

	public Route() {
		super();
		// TODO Auto-generated constructor stub
	}

	
}
