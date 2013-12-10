package org.elsys;

public class Grade {
	private static int id = 0;
	private int mark;
	private Subject subject;
	private String date;
	private String reason;
	
	public Grade(int mark, Subject subject,String date, String reason) {
		++id;
		this.mark = mark;
		this.subject = subject;
		this.date = date;
		this.reason = reason;
	}
	
	public static int getLastId() {
		return id;
	}

	public int getMark() {
		return mark;
	}

	public void setMark(int mark) {
		this.mark = mark;
	}

	public Subject getSubject() {
		return subject;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}
	
	
	
}
