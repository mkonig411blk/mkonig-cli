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
    puts "To see all offices with open positions, enter 'list offices'."
    puts "To see all departments with open positions, enter 'list departments'."
    puts "To see all open positions in a particular office, enter 'list positions in an office'."
    puts "To see all open positions in a particular department, enter 'list positions in a department'."
    puts "To quit, type 'exit'."
    command = ""
    until command == "exit"
      command = gets.chomp.downcase
          if command == "list positions"
              list_positions
          elsif command == "list offices"
              list_offices
          elsif command == "list departments"
              list_departments
          elsif command == "list positions in an office"
              list_positions_by_office
          elsif  command == "list positions in a department"
              list_positions_by_department
          else  
          end
      end
  end 
  
  def list_positions
        Position.all.each_with_index do |pos,index| 
            puts "#{index+1}. #{pos.name} - #{pos.department.name} - #{song.office.name}" 
        end
  end 
  
  def list_offices 
        Office.all.each_with_index do |off,index| 
            puts "#{index+1}. #{off.name}" 
        end
  end 
  
  def list_departments 
        Department.all.each_with_index do |dpt,index| 
            puts "#{index+1}. #{dpt.name}" 
        end
  end 
  
  def list_positions_by_office
    list_offices
    puts "Please enter an office:"
    input = gets.chomp.downcase
      if office = Office.all.find {|off| off.name.downcase == input}
          Position.all.each_with_index do |pos, index| 
              if pos.office.name.downcase == input
                  puts "#{index+1}. #{pos.name} - #{pos.department.name} - #{song.office.name}" 
              else
                #skip?
              end
          end
      end
  end 
  
  def list_positions_by_department
    list_departments
    puts "Please enter a department:"
    input = gets.chomp.downcase
      if department = Department.all.find {|dpt| dpt.name.downcase == input}
          Position.all.each_with_index do |pos, index| 
              if pos.department.name.downcase == input
                  puts "#{index+1}. #{pos.name} - #{pos.department.name} - #{song.office.name}" 
              else
                next
                ## check whether next works this way
              end
          end
      end
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
