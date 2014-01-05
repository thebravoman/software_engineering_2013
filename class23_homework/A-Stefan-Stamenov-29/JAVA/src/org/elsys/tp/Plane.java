package org.elsys.tp;

public class Plane {

	private int[][] seats = new int[27][6];

	public void print() {
		for (int i = 0; i < 27; i++) {
			System.out.print("row" + (i + 1) + "-->");
			for (int j = 0; j < 6; j++) {
				if (j == 3) {
					System.out.print(" ");
				}
				System.out.print(seats[i][j]);
			}
			System.out.println();
		}
	}

	public int collocation(int group) {
		int flag = 0;
		for (int r = 0; r < 27; r++) {
			flag = 0;
			// int flag = 0;
			if (group == 1) {
				for (int pl = 0; pl < 6; pl++) {
					if (seats[r][pl] == 0) {
						seats[r][pl] = 1;
						flag = 1;
						break;
					}
				}
				if (flag == 1) {
					break;
				}

			}
			if (group == 2) {
				if (seats[r][0] == 0 && seats[r][1] == 0) {
					seats[r][0] = 2;
					seats[r][1] = 2;
					flag = 1;
					break;
				} else if (seats[r][1] == 0 && seats[r][2] == 0) {
					seats[r][1] = 2;
					seats[r][2] = 2;
					flag = 1;
					break;
				} else if (seats[r][3] == 0 && seats[r][4] == 0) {
					seats[r][3] = 2;
					seats[r][4] = 2;
					flag = 1;
					break;
				} else if (seats[r][4] == 0 && seats[r][5] == 0) {
					seats[r][4] = 2;
					seats[r][5] = 2;
					flag = 1;
					break;
				}
			}

			if (group == 3) {
				if (seats[r][0] == 0 && seats[r][1] == 0 && seats[r][2] == 0) {
					seats[r][0] = 3;
					seats[r][1] = 3;
					seats[r][2] = 3;
					flag = 1;
					break;
				} else if (seats[r][3] == 0 && seats[r][4] == 0
						&& seats[r][5] == 0) {
					seats[r][3] = 3;
					seats[r][4] = 3;
					seats[r][5] = 3;
					flag = 1;
					break;
				}

			}
			if (r == 26 && flag == 0) {
				System.out.println("ERRRRRRRRRRRRRRRRRRRRRRR");
				return flag;
			}
		}
		return flag;
	}
}
