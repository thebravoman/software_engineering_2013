public class Milko_Filipov
{
	public static void main(String[] args)
	{	
		int i = 0;
		int j = 0;
		if ( args.length > 0)
		{
			if(args[args.length-1].equals("down")) 
			{
				i=args.length-2;
				while (i>=0)
				{	
					if(System.getProperty(args[i]) != null) 
						System.out.println(System.getProperty(args[i]));
					i-=1;
				}				
			} else {
				i = 0;
				while (i<args.length)
					{
						if(System.getProperty(args[i]) != null) 
							System.out.println(System.getProperty(args[i]));
						i+=1;
					}
				}
		}
	}
}
			
