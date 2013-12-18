package org.elsys.se.class22.homework;

public class HamRadioBeacon {
	private String callsign;
	private double txFrequency;
	private String locator;
	
	public HamRadioBeacon(String call, double tx, String loc) {
		this.callsign = call;
		this.txFrequency = tx;
		this.locator = loc;
	}

	public String getCallsign() {
		return callsign;
	}

	public void setCallsign(String callsign) {
		this.callsign = callsign;
	}

	public double getTxFrequency() {
		return txFrequency;
	}

	public void setTxFrequency(double txFrequency) {
		this.txFrequency = txFrequency;
	}

	public String getLocator() {
		return locator;
	}

	public void setLocator(String loc) {
		this.locator = loc;
	}
	
	public void printInfo() {
		System.out.println(this.callsign + " " + this.txFrequency + " " + this.locator);
	}
	
	
}
