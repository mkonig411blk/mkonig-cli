class CommandLineInterface

  def run
    scrape
    welcome
  end

  def scrape
    Scraper.make_classes
  end
  
  def welcome 
    puts "Welcome to Margot's CLI Project to discover all of the open positions at Sweetgreen!"
    puts "To see all open positions, enter 'list positions'."
    puts "To see all their offices with open positions, enter 'list offices'."
    puts "To see all their departments with open positions, enter 'list departments'."
    puts "To see all open positions in a particular office, enter 'list offices'."
    puts "To count how many openings exist in a particular office, enter 'list offices'."
    puts "To see all open positions in a particular department, enter 'list departments'."
    puts "To count how many openings exist in a particular department, enter 'list departments'."
  end 
  
  def list_positions
  end 
  
  def list_offices 
  end 
  
  def list_departments 
  end 
  
  def count_positions
  end 
  
  

  # def add_attributes_to_students
  #   Student.all.each do |student|
  #     attributes = Scraper.scrape_profile_page(BASE_PATH + student.profile_url)
  #     student.add_student_attributes(attributes)
  #   end
  # end

  # def display_students
  #   Student.all.each do |student|
  #     puts "#{student.name.upcase}".colorize(:blue)
  #     puts "  location:".colorize(:light_blue) + " #{student.location}"
  #     puts "  profile quote:".colorize(:light_blue) + " #{student.profile_quote}"
  #     puts "  bio:".colorize(:light_blue) + " #{student.bio}"
  #     puts "  twitter:".colorize(:light_blue) + " #{student.twitter}"
  #     puts "  linkedin:".colorize(:light_blue) + " #{student.linkedin}"
  #     puts "  github:".colorize(:light_blue) + " #{student.github}"
  #     puts "  blog:".colorize(:light_blue) + " #{student.blog}"
  #     puts "----------------------".colorize(:green)
  #   end
  # end

end
