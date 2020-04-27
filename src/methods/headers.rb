require 'tty-prompt'

HEADER_LINE = "--------------------------------------------------------------"
HEADER_LENGTH = HEADER_LINE.length

def appWelcome
  clear
  puts HEADER_LINE
  puts "💊 MedMinder".center(HEADER_LENGTH)
  puts "A developers Medical Wizard, This CLI application can keep\ntrack of all your medical information.".center(HEADER_LENGTH)
  # puts "D".center(HEADER_LENGTH)
  puts HEADER_LINE
  puts
end

def clear
  puts "\e[2J\e[f"
end



