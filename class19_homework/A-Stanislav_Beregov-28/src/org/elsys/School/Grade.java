package org.elsys.School;
import java.util.Date;
public class Grade {
	Date date;
	int studentNo;
	int val;
	Subject subjName;
	protected Date getDate() {
		return date;
	}
	protected void setDate(Date date) {
		this.date = date;
	}
	protected int getStudentNo() {
		return studentNo;
	}
	protected void setStudentNo(int studentNo) {
		this.studentNo = studentNo;
	}
	protected int getVal() {
		return val;
	}
	protected void setVal(int val) {
		this.val = val;
	}
	protected Subject getSubjName() {
		return subjName;
	}
	protected void setSubjName(Subject subjName) {
		this.subjName = subjName;
	}
	
}
