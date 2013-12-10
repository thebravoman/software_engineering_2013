class Nikola_Budinov 
{
	public static void main(String[] args) 
	{
		int i=0,z,l;
		String ch;
		
		if (args.length > 0) 
		{
			l = args.length;
			if ( (args[args.length-1]).equals("up") )
			{
				while (i<l)   						
				{
					if ((ch = System.getProperty(args[i])) != null)
					{		
					System.out.println(ch);
				}
				i = i+1;
				}
			}
			else 
			{	l--;
				while (l>=i)   						
				{
					if ((ch = System.getProperty(args[l])) != null)
					{		
					System.out.println(ch);
					}
				l--;
				}
			}
		}
		else System.out.println("Nope..write some args next time u little fella");	
	}
}
