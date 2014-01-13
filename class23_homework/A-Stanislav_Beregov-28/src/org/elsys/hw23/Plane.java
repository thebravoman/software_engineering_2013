package org.elsys.hw23;

import java.io.IOException;
import java.util.Random;

public class Plane {

	static int[][] passengers = new int[27][2];
	
	static boolean addGroup(int gsize){
		for(int i = 0; i < 27; ++i){
			for(int a = 0; a < 2; ++a){
				if(passengers[i][a] <= 3-gsize){
					passengers[i][a] += gsize;
					return true;
				}
			}
		}
		return false;
	}
	
	public static void main(String[] args) throws IOException {
		Random random = new Random();
		while(true){
			 int rand = random.nextInt(3) + 1;
			 if(addGroup(rand))System.out.println("successfully added a group of " + rand + " passengers!");
			 else System.out.println("Not enough space for a group of " + rand + " passengers!");
			 System.in.read();
			 System.in.read();
		}
	}
}
