
require 'yaml'
require 'tty-prompt'
# require 'pp'

require_relative '../methods/headers'
require_relative 'main_menu'
require_relative 'users'
$prompt = TTY::Prompt.new


def add_medication
  add_new_medication = $prompt.collect do
    
    key("Medication_List") do
    key(:Name).ask('Medication Name', required: true) 
    key(:Type).ask('Medication Type')
    key(:Dosage).ask('What is the Dosage')
    key(:Frequency).ask('How often is this medication required?')
    end
  end

  puts "#{add_new_medication[:name]} has been added"
  File.open(path, "w") { |file| file.write(add_new_medication.to_yaml) }
  # puts [[ 'Medication_List', "Medication_Name" ]].to_yaml( :Indent => 4, :UseHeader => true, :UseVersion => true, :UseFold => true )
  user_medications 
end



# __________________________________

def remove_medication
  medication_info = YAML.load(File.read("#{path}"))
  if medication_info == nil
    puts "There are no medications to list"
    else
      medication_info.each do |k, v|
        puts "#{k} #{v}"
        
        
       remove_medication_key =  $prompt.expand('Remove Medication?') do |q|
          q.choice key: 'y', name: 'Remove medication' do medication_info.delete"#{k}" end
            File.open(path, "w") { |file| file.write(remove_medication_key.to_yaml) }
            
            # q.choice key: 'd', name: 'delete all medications',    value: :delete.all.medication_info[""]
            # q.choice key: 'q', name: 'Quit', value: :quit 
          end
          user_medications 
    end
  end
end
# __________________________________




def user_medications
  puts "To add your medication/s please Select Add Medication"
  med_menu = [
    {'Main Menu' => -> do user_menu end},
      {'Add Medication' => -> do add_medication end},
        {'Remove Medication' => -> do remove_medication end},
          {'Current Medication' => ->  do current_medication end},
            {'Quit' => -> do exit_app end}
            ]
            $prompt.select("", med_menu)
end
          



def current_medication
  medication_data = YAML.load(File.read("#{@path}"))
  medication_info = medication_data
  puts medication_info.inspect
  if medication_info.empty?
    puts " There Is no medication Information Available. Please Add your medications"
    user_medications
  end
  response = $prompt.yes?("Return To Medication Menu")
  if response ==  true
    clear
    appWelcome
    user_medications
  else
    clear
    exit_app
  end

end

          
          