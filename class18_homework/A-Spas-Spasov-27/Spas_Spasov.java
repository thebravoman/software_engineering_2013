public class Spas_Spasov {
        public static void main(String[] args) {
                int a=0,b,c;
                String check;
                if(args.length>0) {
                        if(args[args.length-1].equals("down")) {
                                b=-1;
                                c=args.length-1;
                                a=args.length-2;
                        } else {
                                b=1;
                                c=args.length;
                        }
                        while((a<c) && (a>-1)) {
                                if((check=System.getProperty(args[a])) != null) {
                                        System.out.println(check);
                                }
                                a+=b;
                        }
                }
        }
}
