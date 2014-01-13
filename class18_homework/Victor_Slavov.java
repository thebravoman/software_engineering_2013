public class Victor_Slavov{
	public static void main(String[] args) 
	{
		String argument;
		if(args[args.length-1].equals("down"))
		{
			for(int i = args.length - 1; i >= 0; i = i - 1) 
			{
				argument = System.getProperty(args[i]);
				
				if(argument != null)
				{
					System.out.println(argument);
				}
			}
		}
		else
		{
			for(int i = 0; i <= args.length - 1; i = i + 1) 
			{
				argument = System.getProperty(args[i]);
				
				if(argument != null)
				{
					System.out.println(argument);
				}
			}
		}
	}
}
