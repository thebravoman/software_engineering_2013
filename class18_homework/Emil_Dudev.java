public class Emil_Dudev {
	public static void main( String[] args ) {
		String value;
		int index;
		if( args.length >= 1 ) {
			index = args.length - 1;
			if( args[index].equals( "down" ) ) {
				for( --index; index >= 0; --index ) {
					value = System.getProperty( args[index] );
					if( value != null )
						System.out.println( value );
				}
			} else {
				for( String arg : args ) {
					value = System.getProperty( arg );
					if( value != null )
						System.out.println( value );
				}
			}
		}
	}
}
