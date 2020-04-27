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
require_relative 'classes/users'
require_relative 'classes/medications'
require_relative './methods/headers'



profile = Users.new

profile.user_selection
