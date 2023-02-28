package org.antwalk.entity;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Embeddable;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

// NOT AN ENTITY

@Embeddable
public class RouteAndStop implements Serializable {
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "route_id", referencedColumnName = "rid")
	private Route r;
	
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "stop_id", referencedColumnName = "sid")
	private Stop s;


	public Route getR() {
		return r;
	}


	public void setR(Route r) {
		this.r = r;
	}


	public Stop getS() {
		return s;
	}


	public void setS(Stop s) {
		this.s = s;
	}


	public RouteAndStop(Route r, Stop s) {
		super();
		this.r = r;
		this.s = s;
	}


	public RouteAndStop() {
		super();
		// TODO Auto-generated constructor stub
	}


	@Override
	public int hashCode() {
		return Objects.hash(r, s);
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		RouteAndStop other = (RouteAndStop) obj;
		return Objects.equals(r, other.r) && Objects.equals(s, other.s);
	}

	
	
	
	
	
	
}
