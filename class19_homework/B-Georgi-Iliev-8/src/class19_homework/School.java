package class19_homework;

public class School {
	

	private String SchoolName;
	private int NumberOfClasses;
	private String adress;
	
	School(){
		NumberOfClasses = 0;
	}
	public String getSchoolName() {
		return SchoolName;
	}

	public void setSchoolName(String schoolName) {
		this.SchoolName = schoolName;
	}

	public int getNumberOfClasses() {
		return NumberOfClasses;
	}

	public void setNumberOfClasses(int numberOfClasses) {
		NumberOfClasses = numberOfClasses;
	}

	public String getAdress() {
		return adress;
	}

	public void setAdress(String adress) {
		this.adress = adress;
	}
	
	
}
