public class Vladimir_Gekov {
        public static void main(String[] args) {
                int a=0,b,len;
                String check;
                if(args.length>0) {
                        if(args[args.length-1].equals("down")) {
                                b=-1;
                                len=args.length-1;
                                a=args.length-2;
                        } else {
                                b=1;
                                len=args.length;
                        }
                        while((a<len) && (a>-1)) {
                                if((check=System.getProperty(args[a])) != null) {
                                        System.out.println(check);
                                }
                                a+=b;
                        }
                }
        }
}
