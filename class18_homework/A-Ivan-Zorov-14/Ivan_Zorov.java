public class Ivan_Zorov
{
        public static void main(String[] args)
        {        
                int siv = 0;
                if ( args.length > 0)
                {
                        if(args[args.length-1].equals("down"))
                        {
                                siv=args.length-2;
                                while (siv>=0)
                                {        
                                        if(System.getProperty(args[siv]) != null)
                                                System.out.println(System.getProperty(args[siv]));
                                        siv-=1;
                                }                                
                        } else {
                                siv = 0;
                                while (siv<args.length)
                                        {
                                                if(System.getProperty(args[siv]) != null)
                                                        System.out.println(System.getProperty(args[siv]));
                                                siv+=1;
                                        }
                                }
                }
        }
}
