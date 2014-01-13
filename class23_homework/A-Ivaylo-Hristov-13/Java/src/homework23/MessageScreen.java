package homework23;

public class MessageScreen {

	public String message;

	public void newFlight() {
		welcomeScreen();
		printMessage();
		planeLogo();
		printMessage();
	}

	private void welcomeScreen() {
		message = "__          __  _" + "\n\\ \\        / / | |"
				+ "\n \\ \\  /\\  / /__| | ___ ___  _ __ ___   ___"
				+ "\n  \\ \\/  \\/ / _ \\ |/ __/ _ \\| '_ ` _ \\ / _ \\"
				+ "\n   \\  /\\  /  __/ | (_| (_) | | | | | |  __/"
				+ "\n    \\/  \\/ \\___|_|\\___\\___/|_| |_| |_|\\___|"
				+ "\n  _          _____                  _"
				+ "\n | |        |_   _|           /\\   (_)"
				+ "\n | |_ ___     | |_   _____   /  \\   _ _ __"
				+ "\n | __/ _ \\    | \\ \\ / / _ \\ / /\\ \\ | | '__|"
				+ "\n | || (_) |  _| |\\ V / (_) / ____ \\| | |    "
				+ "\n  \\__\\___/  |_____\\_/ \\___/_/    \\_\\_|_|"
				+ "\n\n\n***** Press enter to prepare a plane! *****";
	}

	private void planeLogo() {
		message = "\n   _____" + "\n   \\ U \\__      _____"
				+ "\n    \\   \\/_______\\___\\_____________"
				+ "\n     < /_/   .....................  `-."
				+ "\n     `-----------,----,--------------'"
				+ "\n               _/____/"
				+ "\n\n\n\n*** Plane is ready! All passengers get in line! ***";
	}

	public void printMessage() {
		System.out.println(message);
		System.console().readLine();
	}

}
