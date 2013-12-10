package org.elsys.homework18;

import java.util.Arrays;

public class Nikolay_Dionisov {

    public static void main(String[] args) {
    	Boolean incr = true;
    	if(args.length >= 1) {
	    	if(args[args.length-1].equals("down")) {
	    		incr = false;
	    	}
    	}
    	int count = 0;
    	for(int i = 0; i < args.length; i++) {
    		String out = System.getProperty(args[i]);
    		if(out != null) {
    			count++;
    		}
    	}
    	String[] props = new String[count];
    	count = 0;
    	for(int i = 0; i < args.length; i++) {
    		String out = System.getProperty(args[i]);
    		if(out != null) {
    			props[count] = out;
    			count++;
    		}
    	}
    	
    	Arrays.sort(props);
    	for(int i = 0; i < props.length; i++) {
    		int ind = i;
    		if(!incr) {
    			ind = props.length - i - 1;
    		}
    		System.out.println(props[ind]);
    	}
    }

}