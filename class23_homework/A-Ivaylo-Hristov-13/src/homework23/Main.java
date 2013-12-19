package homework23;

public class Main {
	public static void main(String[] args) {
		Main start = new Main();
		Plane Ivo63 = new Plane(28, 6);

		start.printWelcomeScreen();
		start.printPlane();
		start.NewFlight(Ivo63, start);
	}

	public void NewFlight(Plane plane, Main flight) {
		while (plane.passengers > 0) {
			Group newGroup = new Group();
			if (newGroup.members > plane.passengers)
				continue;

			if (newGroup.members == 1)
				plane.message = "*** " + newGroup.members
						+ " new passenger is looking for a seat. ***";
			else
				plane.message = "*** " + newGroup.members
						+ " new passengers are looking for seats. ***";

			printMessage(plane.message);
			plane.addPassengers(newGroup);
			plane.printSeats();
			System.console().readLine();
			printMessage(plane.message);
		}

		printMessage("*** The plane is full. Please put on your seat belts! ***");
	}

	public void printPlane() {
		System.out.println("\n\n\n\n\n");
		System.out.println("   _____");
		System.out.println("   \\ U \\__      _____");
		System.out.println("    \\   \\/_______\\___\\_____________");
		System.out.println("     < /_/   .....................  `-.");
		System.out.println("     `-----------,----,--------------'");
		System.out.println("            _/____/");
		printMessage("\n\n\n*** Plane is ready! All passengers get in line! ***");
	}

	public void printWelcomeScreen() {
		System.out.println("__          __  _");
		System.out.println("\\ \\        / / | |");
		System.out.println(" \\ \\  /\\  / /__| | ___ ___  _ __ ___   ___");
		System.out
				.println("  \\ \\/  \\/ / _ \\ |/ __/ _ \\| '_ ` _ \\ / _ \\");
		System.out.println("   \\  /\\  /  __/ | (_| (_) | | | | | |  __/");
		System.out.println("    \\/  \\/ \\___|_|\\___\\___/|_| |_| |_|\\___|");
		System.out.println();
		System.out.println("  _          _____                  _");
		System.out.println(" | |        |_   _|           /\\   (_)");
		System.out.println(" | |_ ___     | |_   _____   /  \\   _ _ __");
		System.out.println(" | __/ _ \\    | \\ \\ / / _ \\ / /\\ \\ | | '__|");
		System.out.println(" | || (_) |  _| |\\ V / (_) / ____ \\| | |    ");
		System.out.println("  \\__\\___/  |_____\\_/ \\___/_/    \\_\\_|_|");

		System.out.print("\n\n\n***** Press enter to prepare a plane! *****");
		System.console().readLine();
	}

	public static void printMessage(String message) {
		System.out.println(message);
		System.console().readLine();
	}
}
