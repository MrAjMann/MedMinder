require 'yaml'
require 'tty-prompt'
require_relative '../methods/headers'
require_relative 'main_menu'
require_relative 'medications'
$prompt = TTY::Prompt.new

class Users
  attr_accessor :user, :menu, :main_menu, :path, :full_name
  def initialize
    @user = user
    @menu = menu
    @main_menu = main_menu
    @path = path
    @full_name = full_name
  end
  
  # Checks for the Profiles folder 
  # If the Profiles folder exists goes to get_users
  # Else it creates and changes to the directory 
  def user_selection
    if Dir.exists?('../profiles')
      Dir.chdir("../profiles")
      puts Dir.pwd
      user_list
    else
      Dir.mkdir("../profiles")
      puts Dir.pwd
      Dir.chdir("../profiles")
      puts Dir.pwd
      user_list
    end
  end
  # checks to make sure there is a file within the folder 
  # if true then prints a list of users
  #
  def user_list
    appWelcome
    @path = Dir.glob("*").join(', ').to_s
    if File.exist?(@path)
      clear
      appWelcome
      puts "Select your profile"
      profile_menu = [
        {File.basename(@path, ".yml") => -> do user_menu end},
        {'Quit' => -> do exit_app end}
      ]
      $prompt.select("", profile_menu)
      # $prompt.select("Select your profile",File.basename(@path, ".yml") )
      # user_menu
  else
    no_creation_of_profile
    clear
  end
end

# called if the user selects no to creating a new profile
# when no profile exists
def no_creation_of_profile
  clear
  appWelcome
  puts ("Please Create a profile\n") 
  @menu = [
    {'Create Profile' => -> do add_user end},
      {'Quit' => -> do exit_app end }
      ]
  # system 'clear'
    $prompt.select("", @menu)
  end

  # Exits the application
def exit_app
  clear
  puts "Thank you for using MedMinder"
  sleep 1
  clear
  exit
end


def profile_creation
  puts HEADER_LINE
  puts "Create your Profile".center(HEADER_LENGTH)
  puts HEADER_LINE
  puts
  self
end

def init_file(name)
  if !File.exists?("#{@full_name}.yml")
    name = File.new("#{@full_name}.yml", "w")
    name.puts YAML.dump({})
    name.close
  end
end

def load_user_file(name)
  if File.exists?("./#{@full_name}.yml")
    YAML.load("./#{@full_name}.yml")
  #  puts file_load
  end
end

def add_user
  appWelcome
  profile_creation
  @full_name =  $prompt.ask("What is your name?") do |q|
      q.required true
      # q.validate [A-Za-z]
      q.modify   :up
      @full_name = {Name: "#{@full_name}"}
    end
  
    init_file("./#{@full_name}.yml")
    
    load_user_file("./#{@full_name}.yml")
    clear
    puts "#{@full_name}, Your Profile has been created"
    response = $prompt.yes?("Would you like to create a new profile?")
    if response == true
      clear
      appWelcome
      add_user
    else
      user_list
    end

end
  
end


# def initialize_db(name)
#   if !(File.exists?("./db/#{name}_db.yml"))
#     player_db = File.new("./db/#{name}_db.yml", "w")
#     player_db.puts YAML.dump({})
#     player_db.close
#   end
# end
