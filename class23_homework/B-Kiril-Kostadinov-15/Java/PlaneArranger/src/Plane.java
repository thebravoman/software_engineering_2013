/* http://www.youtube.com/watch?v=vLaX8UvVUQw */

import java.util.ArrayList;

public class Plane {
	private int [][] seats;
	ArrayList<Integer> seatLog;
	
	Plane() {
		seats = new int[27][6];
		for(int i = 0; i < 27; i++) {
			for(int j = 0; j < 6; j++) {
				seats[i][j] = 0;
			}
		}
		seatLog = new ArrayList<Integer>();
		for(int i = 0; i < 54; i++) {
			seatLog.add(3);
		}
	}
	
	public void addPeople(int numberOfPeople) {
		if(numberOfPeople == 1) {
			addOnePerson();
		} else if(numberOfPeople == 2) {
			addTwoPeople();
		} else if(numberOfPeople == 3) {
			addThreePeople();
		} else{
			System.out.println("WTF");
		}
	}
	
	private void addOnePerson() {
		int index = seatLog.indexOf(1);
		if(index != -1) {
			if(index % 2 == 0) {
				for(int i = 3; i <= 5; i++) {
					if(seats[(index-1)/2][i] == 0) {
						seats[(index-1)/2][i] = 1;
						seatLog.set(index, 0);
						break;
					}
				}
			} else{
				for(int i = 0; i <= 2; i++) {
					if(seats[index/2][i] == 0) {
						seats[index/2][i] = 1;
						seatLog.set(index, 0);
						break;
					}
				}
			}
		} else{
			index = seatLog.indexOf(2);
			if(index != -1) {
				if(index % 2 == 0) {
					for(int i = 3; i <= 5; i++) {
						if(seats[(index-1)/2][i] == 0) {
							seats[(index-1)/2][i] = 1;
							seatLog.set(index, 1);
							break;
						}
					}
				} else{
					for(int i = 0; i <= 2; i++) {
						if(seats[index/2][i] == 0) {
							seats[index/2][i] = 1;
							seatLog.set(index, 1);
							break;
						}
					}
				}
			} else{
				index = seatLog.indexOf(3);
				if(index % 2 == 0) {
					for(int i = 3; i <= 5; i++) {
						if(seats[(index-1)/2][i] == 0) {
							seats[(index-1)/2][i] = 1;
							seatLog.set(index, 2);
							break;
						}
					}
				} else{
					for(int i = 0; i <= 2; i++) {
						if(seats[index/2][i] == 0) {
							seats[index/2][i] = 1;
							seatLog.set(index, 2);
							break;
						}
					}
				}
			}
		}
	}
	
	private void addTwoPeople() {
		int index = seatLog.indexOf(2);
		if(index != -1) {
			if(index % 2 == 0) {
				for(int i = 3; i <= 4; i++) {
					if(seats[(index-1)/2][i] == 0) {
						seats[(index-1)/2][i] = 2;
						seats[(index-1)/2][i+1] = 2;
						seatLog.set(index, 0);
						break;
					}
				}
			} else{
				for(int i = 0; i <= 1; i++) {
					if(seats[index/2][i] == 0) {
						seats[index/2][i] = 2;
						seats[index/2][i+1] = 2;
						seatLog.set(index, 0);
						break;
					}
				}
			}
		} else{
			index = seatLog.indexOf(3);
			if(index != -1) {
				if(index % 2 == 0) {
					for(int i = 3; i <= 4; i++) {
						if(seats[(index-1)/2][i] == 0) {
							seats[(index-1)/2][i] = 2;
							seats[(index-1)/2][i+1] = 2;
							seatLog.set(index, 1);
							break;
						}
					}
				} else{
					for(int i = 0; i <= 1; i++) {
						if(seats[index/2][i] == 0) {
							seats[index/2][i] = 2;
							seats[index/2][i+1] = 2;
							seatLog.set(index, 1);
							break;
						}
					}
				}
			} else{
				for( int j = 0; j < 2; j++) {
					index = seatLog.indexOf(1);
					if(index % 2 == 0) {
						for(int i = 3; i <= 5; i++) {
							if(seats[(index-1)/2][i] == 0) {
								seats[(index-1)/2][i] = 2;
								seatLog.set(index, 0);
								break;
							}
						}
					} else{
						for(int i = 0; i <= 2; i++) {
							if(seats[index/2][i] == 0) {
								seats[index/2][i] = 2;
								seatLog.set(index, 0);
								break;
							}
						}
					}
				}
			}
		}
	}
	
	private void addThreePeople() {
		int index = seatLog.indexOf(3);
		if(index != 1) {
			if(index % 2 == 0) {
				seats[(index-1)/2][3] = 3;
				seats[(index-1)/2][4] = 3;
				seats[(index-1)/2][5] = 3;
				seatLog.set(index, 0);
			} else{
				seats[index/2][0] = 3;
				seats[index/2][1] = 3;
				seats[index/2][2] = 3;
				seatLog.set(index, 0);
			}
		} else{
			index = seatLog.indexOf(2);
			if(index != -1) {
				if(index % 2 == 0) {
					for(int i = 3; i <= 4; i++) {
						if(seats[(index-1)/2][i] == 0) {
							seats[(index-1)/2][i] = 3;
							seats[(index-1)/2][i+1] = 3;
							seatLog.set(index, 0);
							break;
						}
					}
				} else{
					for(int i = 0; i <= 1; i++) {
						if(seats[index/2][i] == 0) {
							seats[index/2][i] = 3;
							seats[index/2][i+1] = 3;
							seatLog.set(index, 0);
							break;
						}
					}
				}
				index = seatLog.indexOf(2);
				if(index != -1) {
					if(index % 2 == 0) {
						for(int i = 3; i <= 5; i++) {
							if(seats[(index-1)/2][i] == 0) {
								seats[(index-1)/2][i] = 3;
								seatLog.set(index, 1);
								break;
							}
						}
					} else{
						for(int i = 0; i <= 2; i++) {
							if(seats[index/2][i] == 0) {
								seats[index/2][i] = 3;
								seatLog.set(index, 1);
								break;
							}
						}
					}
				} else{
					index = seatLog.indexOf(1);
					if(index % 2 == 0) {
						for(int i = 3; i <= 5; i++) {
							if(seats[(index-1)/2][i] == 0) {
								seats[(index-1)/2][i] = 3;
								seatLog.set(index, 0);
								break;
							}
						}
					} else{
						for(int i = 0; i <= 2; i++) {
							if(seats[index/2][i] == 0) {
								seats[index/2][i] = 3;
								seatLog.set(index, 0);
								break;
							}
						}
					}
				}
			} else{
				for(int j = 0; j < 3; j++) {
					index =  seatLog.indexOf(1);
					if(index % 2 == 0) {
						for(int i = 3; i <= 5; i++) {
							if(seats[(index-1)/2][i] == 0) {
								seats[(index-1)/2][i] = 3;
								seatLog.set(index, 0);
								break;
							}
						}
					} else{
						for(int i = 0; i <= 2; i++) {
							if(seats[index/2][i] == 0) {
								seats[index/2][i] = 3;
								seatLog.set(index, 0);
								break;
							}
						}
					}
				}
			}
		}
	}
	
	public void print() {
		for(int i = 0; i < 27; i++) {
			System.out.println("|" + seats[i][0] + seats[i][1] + seats[i][2] + "|   |" + seats[i][3] + seats[i][4] + seats[i][5] + "|");
		}
	}
}
