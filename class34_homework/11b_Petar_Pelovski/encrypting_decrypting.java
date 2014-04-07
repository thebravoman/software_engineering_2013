package shifrirane;

public class Decrypting {
		public static void main(String[] args){
			int u = 5;
			int i = 1;
			int random = 0;
			int random1 = 0;
			while(u  > 0){
				u = 0;
				random = (int )(Math.random() * 1000 + 1);
				while(i < 1000 & i <= random){
					if(random % i == 0){
						if(i != 1 & i != random){
							u = 5;
						}
					}
					i++;
				}	
				i = 1;
			}
			u = 1;
			i = 1;
			while(u  > 0){
				u = 0;
				random1 = (int )(Math.random() * 1000 + 1);
				while(i < 1000 & i <= random){
					if(random1 % i == 0){
						if(i != 1 & i != random || random1 == random){
							u = 5;
						}
					}
					i++;
				}	
				i = 1;
			}
			int n = random * random1;
			int fn = (random - 1)*(random1 - 1);
			int t = 0;
			int ran = 0;
			while(t == 0){
				t = 2;
				i = 2;
				ran = (int )(Math.random() * fn + 1);
				while(i < 1000){
					if(fn % i == 0 && ran % i == 0){
						t = 0;
					}
					i++;
				}
			}
			int d = 0;
			t = 0;
			while(t == 0){
				d++;
				if(((ran * d) - 1) % fn == 1 ){
						t = 5;
				}
			}
			double message = 2; 
			double encryption = Math.pow(message, ran) % n;
			double decryption = Math.pow(encryption, d) % n;
			System.out.println(decryption);
		}
	}
