class MessageScreen
	def newFlight
		welcomeScreen
		printMessage
		planeLogo
		printMessage
	end

	private
	def welcomeScreen
		@message = <<-STRING.gsub("\t", "")
			__          __  _
			\\ \\        / / | |
			 \\ \\  /\\  / /__| | ___ ___  _ __ ___   ___
			  \\ \\/  \\/ / _ \\ |/ __/ _ \\| '_ ` _ \\ / _ \\
			   \\  /\\  /  __/ | (_| (_) | | | | | |  __/
			    \\/  \\/ \\___|_|\\___\\___/|_| |_| |_|\\___|
			  _          _____                  _
			 | |        |_   _|           /\\   (_)
			 | |_ ___     | |_   _____   /  \\   _ _ __
			 | __/ _ \\    | \\ \\ / / _ \\ / /\\ \\ | | '__|
			 | || (_) |  _| |\\ V / (_) / ____ \\| | |    
			  \\__\\___/  |_____\\_/ \\___/_/    \\_\\_|_|
			
			
			***** Press enter to prepare a plane! *****
		STRING
	end
	
	def planeLogo
	@message = <<-STRING.gsub("\t", "")
	
		_____
		 \\ U \\__      _____
		  \\   \\/_______\\___\\_____________
		   < /_/   .....................  `-.
		   `-----------,----,--------------'
		             _/____/
		
		
		
		*** Plane is ready! All passengers get in line! ***
	STRING
	end
	
	def printMessage
		puts @message
		gets
	end
end