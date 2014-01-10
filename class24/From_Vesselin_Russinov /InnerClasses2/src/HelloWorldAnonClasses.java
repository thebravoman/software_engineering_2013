
public class HelloWorldAnonClasses {

	interface HelloWorld{
		public void greet();
		public void greetSomeone(String someone);
	}
	
	public void sayHello(){
		
		HelloWorld frenchGreeting = new HelloWorld(){
			private String name = "emptyFrenchName";
			
			@Override
			public void greet() {
				greetSomeone(name);
			}

			@Override
			public void greetSomeone(String someone) {
				name = someone;
				System.out.println("Bonjur, " + name);
			}
			
		};
		
		HelloWorld spanishGreeting = new HelloWorld() {
			private String name = "emptySpanishName";
			
			@Override
			public void greet() {
				greetSomeone(name);
			}

			@Override
			public void greetSomeone(String someone) {
				name = someone;
				System.out.println("Hola, " + name);
			}
		};
		
		frenchGreeting.greetSomeone("Claudia");
		frenchGreeting.greetSomeone("Janna");
		
		spanishGreeting.greetSomeone("Carla");
	}
	
	public static void main(String[] args) {
		HelloWorldAnonClasses hello = new HelloWorldAnonClasses();
		hello.sayHello();
	}

}
