package org.elsys.plane;

public class SeatsAranger {
	static void Arange(int rand){
		int temp=0;
		int i=0;
			for(int j=0;j<6;j++){
				if((Plane.seats[i][j]==0) && (temp<rand)){
					if(j+rand-temp<=3){
						Plane.seats[i][j]=rand;
						temp++;
					}
					else{
						if((j>=3) && (temp<rand) && (j+rand-temp<=6)){
							Plane.seats[i][j]=rand;
							temp++;
						}
						else{
							if((j>2) && (i<26)){
								i++;
								j=-1;
							}
						}
					}
				}
				else{
					if((temp<rand) && (j==5) && (i<26)){ i++; j=-1; }
				}
			}
			if(temp<rand) System.out.println("Request denied\n");
	}
}
