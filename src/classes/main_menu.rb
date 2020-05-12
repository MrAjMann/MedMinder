# frozen_string_literal: true

require 'tty-prompt'
require_relative '../methods/headers'
require_relative 'users'
require_relative 'medications'

$prompt = TTY::Prompt.new

def user_menu
  clear
  appWelcome
  puts "Welcome #{File.basename @path, '.yml'} Please Select your Profile: "
  @menu = [
    { 'Profile' => -> do user_profile end },
    { 'Medications' => -> do user_medications end },
    { 'Quit' => -> do exit_app end }
  ]
  $prompt.select('', @menu)
end

