# frozen_string_literal: true

HEADER_LINE = "---------------------------------------------------"
HEADER_LENGTH = HEADER_LINE.length



def appWelcome
  font = TTY::Font.new(:standard)
  pastel = Pastel.new
  clear
  puts HEADER_LINE
  puts pastel.blue(font.write("MedMinder")).center(HEADER_LENGTH)
  puts 'A developers Medical Wizard, This CLI application can keep\ntrack of all your medical information.'.center(HEADER_LENGTH)
  puts HEADER_LINE
  puts
end
