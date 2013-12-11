import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Martin_Stoyanov {
	
		public static void main(String[] args) {
			List<String> ye = new ArrayList<String>();
			int i = 0;
			int c = 0;
			for (i=0;i<args.length;i++) {
				if(System.getProperty(args[i]) != null ) {
					String b = System.getProperty(args[i]) + "\n";
					ye.add(b);
				}
			}
			if (args[args.length-1].equals("down")) {
				Collections.reverse(ye);
			}
			for(int j = 0; j < ye.size(); j++) {
		           System.out.println(ye.get(j));
		       }
		}
}


