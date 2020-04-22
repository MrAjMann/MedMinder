class Profile
  attr_accessor :first_name, :last_name
  attr_reader :has_Profile


  def initialize
    @first_name = first_name
    @last_name = last_name
    # @password = password
    puts "Create your profile"
    puts "Please enter your First name then press ENTER"
    first_name = gets.chomp.upcase
    puts "Please enter your Last name then press ENTER"
    last_name = gets.chomp.upcase
    puts "Thanks #{first_name} #{last_name}, Your profile has been created"
    puts "*" * 32
    return has_Profile = true
  end

  # def create_profile
  #   puts "Create your profile"
  #   puts "Please enter your name"
  #   # name = gets.chomp
  # end


end
profile = Profile.new
