package com.demo.vo;

import java.sql.Timestamp;

public class AddFlightVo {
	private String flightNo;
	private Timestamp startTime;
	private Timestamp endTime;
	private String from;
	private String to;
	private int priceU;
	private int priceP;
	private String airNo;
	public String getFlightNo() {
		return flightNo;
	}
	public void setFlightNo(String flightNo) {
		this.flightNo = flightNo;
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
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public int getPriceU() {
		return priceU;
	}
	public void setPriceU(int priceU) {
		this.priceU = priceU;
	}
	public int getPriceP() {
		return priceP;
	}
	public void setPriceP(int priceP) {
		this.priceP = priceP;
	}
	public String getAirNo() {
		return airNo;
	}
	public void setAirNo(String airNo) {
		this.airNo = airNo;
	}
}
