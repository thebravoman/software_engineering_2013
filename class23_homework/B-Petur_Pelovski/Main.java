package samolet;
import java.io.*;

public class Main {
	public static void main(String[] args){
		random r = new random();
		int a = 0;
		int redove = 0;
		int redove1 = 0;
		int b = 0;
		int i = 0;
		int i1 = 0;
		int u = 0;
		int col = 3;
		final int ROWS = 28;
		final int COLS = 7;
		InputStreamReader varName = new InputStreamReader(System.in) ;
		BufferedReader bufer = new BufferedReader(varName) ;
		int[][] array = new int[ROWS][COLS];
		while(a < 27){
			while(b < 6){
				array[a][b] = 0;
				b++;
			}
			a++;
		}
		a = 0;
		b = 0;
		while(u != 2){
			i = r.random1();
			System.out.print("There is a group of ");
			System.out.print(i);
			System.out.print(" people to be placed");
			try {
				bufer.readLine();
			} 
			catch (IOException e) {
				System.out.println("error");
			}
			while(i1 < i){
				//array[row][i2] = 1;
				//i2++;
				//i1++;
				while(redove < 27){
					while(redove1 < 6){
						if(i == 1){
							if(array[redove][redove1] == 0){
								array[redove][redove1] = 1;
								i = 0;
								redove1++;
								break;
							}
						}
						if(i == 2 && redove1 < 5){
							if(array[redove][redove1] == 0 && array[redove][redove1+1] == 0 && redove1 != 2){
								array[redove][redove1] = 1;
								array[redove][redove1 + 1] = 1;
								i = 0;
								redove1++;
								break;
							}
						}
						if(i == 3 && redove1 < 4){
							if(array[redove][redove1] == 0 && array[redove][redove1+1] == 0 && array[redove][redove1 + 2] == 0 && redove1 != 2 && redove1 != 1 && redove1 != 4 && redove1 != 5){
								array[redove][redove1] = 1;
								array[redove][redove1 + 1] = 1;
								array[redove][redove1 + 2] = 1;
								i = 0;
								redove1++;
								break;
							}
						}
						redove1++;
					}
					redove++;
					redove1 = 0;
				}
				i1++;
			}
			i1 = 0;
			redove  = 0;
			redove1 = 0;
			u = 2;
			while(a < 27){
				while(b < 6){
					System.out.print(array[a][b]);
					if(array[a][b] == 0){
						u = 1;
					}
					b++;
					if(b == 3){
						System.out.print(" ");
					}
				}
				a++;
				System.out.println();
				b = 0;
			}
			a = 0;
			b = 0;
			col = col - i;
		}
	}
}
