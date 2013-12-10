public class Luben_Temelakiev {
        public static void main(String[] args) {
                int a=0,b,l;
                String check;
                if(args.length>0) {
                        if(args[args.length-1].equals("down")) {
                                b=-1;
                                l=args.length-1;
                                a=args.length-2;
                        } else {
                                b=1;
                                l=args.length;
                        }
                        while((a<l) && (a>-1)) {
                                if((check=System.getProperty(args[a])) != null) {
                                        System.out.println(check);
                                }
                                a+=b;
                        }
                }
        }
}
