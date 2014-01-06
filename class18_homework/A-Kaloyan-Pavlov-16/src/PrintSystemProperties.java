public class PrintSystemProperties 
{
	public static void main(String[] args)
	{
		if(args.length > 0)
		{
			if(args[args.length - 1].equals("up"))
			{
				for(int arg = 0; arg < args.length - 1; arg++)
				{
					if (System.getProperty(args[arg]) != null)
		                System.out.println(System.getProperty(args[arg]));
				}
			}
			else if (args[args.length - 1].equals("down"))
			{
				for (int argElement = args.length - 2; argElement >= 0; argElement--)
				{
					 if (System.getProperty(args[argElement]) != null)
		                 System.out.println(System.getProperty(args[argElement]));
				}
			}
		}
	}
}