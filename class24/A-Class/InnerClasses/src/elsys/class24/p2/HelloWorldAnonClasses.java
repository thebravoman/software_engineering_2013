package elsys.class24.p2;

public class HelloWorldAnonClasses {
	
	interface HelloWorld {
		public void greet();
		public void greetSomeone(String someone);
	}
	
	public void sayHello() {
		HelloWorld frenchGreeting = new HelloWorld() {
			private String name = "";
			
			public void greet() {
				greetSomeone(name);
			}
			
			public void greetSomeone(String someone) {
				name = someone;
				System.out.println("Bonjur, " + name);
			}
			
		};
		HelloWorld spanishGreeting = new HelloWorld() {
			private String name = "";
			
			public void greet() {
				greetSomeone(name);
			}
			
			public void greetSomeone(String someone) {
				name = someone;
				System.out.println("Bonjur, " + name);
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
