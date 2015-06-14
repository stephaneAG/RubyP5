#StephaneAG - SerialDuino communication
# "my first sktech using RbPr"

class SerialDuino < Processing::App
	
	#load_library :serial
 	#import 'processing.serial.Serial'
#Serial.list
 	
	
	
	#-- SETUP --
	def setup
	
		#loading the font
		@font = loadFont "ArialMT-16.vlw"
		
		#loadig the intro paragraph
		@intro_file_path = "#{sketch_path}/data/introParagraph.txt"
		#@intro_data = File.readlines(@intro_file_path)
		@intro_data = File.read(@intro_file_path)
		
		#-- USER INPUT --
		@typing, @saved = "", ""
  		text_font create_font "Arial", 16, true # set the font for text
		
	end
	
	#-- DRAW --
	def draw
	
		#defining bckgrnd
		background 125
		
		#specifying font to be used
		text_font @font, 16
		#specifying font color
		fill 0
		
		#display stuff
		display_app_header
		display_user_input
		#display_text
		
		Serial.list
		
	
	end
	
	#--Fcts / Mthds DEFS --
	
		#-- application header
		def display_app_header
		
			#specifying font to be used
			text_font @font, 25
			#setting title to dipslay
			text "SerialDuino v1a - StephanAG 2012", 10 ,25
			
			#display intro paragraph
			text_font @font, 13
			text @intro_data, 10 ,45
		end
	
		#-- simple display text mthd
		def display_text
			#specifying font to be used
			#text_font @font, 16
			#text "Mmmmm ... Strings .... ", 10, 100
		end
		
		#-- USER INPUT --
		def display_user_input
			indent = 25
  			fill 255
  			text "Click in this applet and type. \nHit return to save what you typed. ", indent, 100
  			text @typing, indent, 150
  			text @saved, indent, 190 
		end
		
		#-- KEY PRESSED --
		def keyPressed
  
  			# If the return key is pressed, save the String and clear it
  			if key == "\n"
    			@saved  = @typing
    			@typing = "" # A String can be cleared by setting it equal to ""
  			else
    			# Otherwise, concatenate the String
    			# Each character typed by the user is added to the 
    			# end of the String variable.
    			@typing = @typing + key if key.is_a? String 
  			end
		end
	
	

end

SerialDuino.new :title => "SerialDuino", :width => 500, :height => 400