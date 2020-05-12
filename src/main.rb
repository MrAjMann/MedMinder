#---------------------------------------------------------------------------------------------------------------------
#                                 💊 MedMinder
#                                  Terminal App
#
#                             Designed and Developed by
#                                 Anthony Mann 
#                 For my Coder Academy: Ruby Terminal Assessment
#                   
#  Version 1.0
#  21 April 2020
#---------------------------------------------------------------------------------------------------------------------
# require 'YAML'
require 'tty-prompt'
require 'tty-font'
require_relative 'classes/users'
require_relative 'classes/medications'
require_relative './methods/headers'

def clear
  puts "\e[2J\e[f"
end

profile = Users.new

profile.user_selection
