package com.demo.po;

import java.sql.Timestamp;

public class Flight {
	private String flightNo;
	private Timestamp startTime;
	private Timestamp endTime;
	private String from;
	private String to;
	private int priceU;
	private int priceP;
	private String airNo;
	private int remainU;
	private int remainP;
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
	public int getRemainU() {
		return remainU;
	}
	public void setRemainU(int remainU) {
		this.remainU = remainU;
	}
	public int getRemainP() {
		return remainP;
	}
	public void setRemainP(int remainP) {
		this.remainP = remainP;
	}
}
