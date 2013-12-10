import java.util.*;
public class GetSystemProperties {

	public static void main(String[] args) {
		if (args.length == 0) {
			Properties p = System.getProperties();
			p.list(System.out);
		}
		else {
			ArrayList<String> properties = new ArrayList<String>();
			String property;
			boolean up = true;
			for(int i=0;i<args.length;++i) {
				if(args[i].contains("down")) {
					up = false;
				}
				property = System.getProperty(args[i]);
				if (property != null) {
					properties.add(property);
				}
			}
				if(up == true) {
					for(int j=0;j<properties.size();++j) {
						System.out.println(properties.get(j));
					}
				}
				if(up == false) {
					for(int j=properties.size() - 1;j>=0;--j) {
						System.out.println(properties.get(j));
					}
				}
				}
			}
	}
