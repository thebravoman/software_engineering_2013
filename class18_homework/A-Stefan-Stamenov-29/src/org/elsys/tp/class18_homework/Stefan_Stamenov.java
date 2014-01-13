package org.elsys.tp.class18_homework;

public class Stefan_Stamenov {
	public static void main(String[] args) {
		
		if(args.length>0){
			if (args[args.length-1].equals("down")){
				for (int i=(args.length)-1;i>=0;i--){
					if (System.getProperty(args[i])!=null){
						System.out.println(System.getProperty(args[i]));
					}
				}
			} else{
				for (int i=0;i<args.length;i++){
					if (System.getProperty(args[i])!=null){
						System.out.println(System.getProperty(args[i]));
					}		
				}
			}
		}
	}
}