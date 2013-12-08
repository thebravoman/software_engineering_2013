import java.util.Properties;

public class Alexander_Angelosky {

	
	public static void main(String[] args) {
		Properties prop = System.getProperties();
		String last = args[args.length-1];
		int pr = 0;
		for(int i = 0; i<args.length; i++){
			if(prop.getProperty(args[i])!=null){
				pr++;
			}                                                                                      
		}
		String [] properties = new String[pr];
		//System.out.println(pr);
		int k = 0;
		for(int i = 0; i<args.length; i++){
			if(prop.getProperty(args[i])!=null){
				//System.out.println(k);
				//System.out.println(args[i]);
				//System.out.println(prop.getProperty(args[i]));
				properties[k] = prop.getProperty(args[i]);
				k++;
			}
		}
		//System.out.println(pr);
		//System.out.println(properties.length);
		if(last.equals("up")||!last.equals("down")){
			for(int i = 0; i<pr-1; i++){
				int min = i;
				for(int j = i+1; j<pr; j++){
			//		System.out.printf("j: %d, min:%d, i:%d, pr:%d\n", j, min, i,pr);
					if(properties[j].compareTo(properties[min])<0){
						min = j;
					}
				}
				String temp = properties[i];
				properties[i] = properties[min];
				properties[min] = temp;
			}
		}
		else {
			for(int i = 0; i<pr-1; i++){
				int max = i;
				for(int j = i+1; j<pr; j++){
					if(properties[j].compareTo(properties[max])>0){
						max = j;
					}
				}
				String temp = properties[i];
				properties[i] = properties[max];
				properties[max] = temp;
			}
		}
		for(int i = 0; i<properties.length; i++){
			System.out.println(properties[i]);
		}

	}

}
