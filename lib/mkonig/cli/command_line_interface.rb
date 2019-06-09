class CommandLineInterface

  def run
    scrape
    welcome
  end

  def scrape
    Scraper.new.make_classes
  end
  
  def welcome 
    puts "Welcome to Margot's CLI Project to discover all of the open positions at Sweetgreen!"
    puts "To see all open positions, enter 'list positions'."
    puts "To see all offices with open positions, enter 'list offices'."
    puts "To see all departments with open positions, enter 'list departments'."
    puts "To see all open positions in a particular office, enter 'list positions in an office'."
    puts "To see all open positions in a particular department, enter 'list positions in a department'."
    puts "To search all open positions by name, enter 'search positions by name'."
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
          elsif command == "search positions by name"
              search_positions_by_name
          elsif command == "list options" || command == "help"
              welcome_messages
          else
          end
      end
  end 
  
  def welcome_messages
    puts "To see all open positions, enter 'list positions'."
    puts "To see all offices with open positions, enter 'list offices'."
    puts "To see all departments with open positions, enter 'list departments'."
    puts "To see all open positions in a particular office, enter 'list positions in an office'."
    puts "To see all open positions in a particular department, enter 'list positions in a department'."
    puts "To search all open positions by name, enter 'search positions by name'."
    puts "To quit, type 'exit'."
  end
  
  def list_positions
      Position.all.each_with_index do |pos,index| 
        puts "#{index+1}. #{pos.name} - #{pos.department.name} in #{pos.office.name}" 
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
    puts "Please enter an office name:"
    input = gets.chomp.downcase
    counter = 1
      if office = Office.all.find {|off| off.name.downcase == input}
          Position.all.each do |pos| 
              if pos.office.name.downcase == input
                  puts "#{counter}. #{pos.name} - #{pos.department.name} in #{pos.office.name}" 
                  counter += 1
              else
              end
          end
      end
  end 
  
  def list_positions_by_department
    list_departments
    puts "Please enter a department name:"
    input = gets.chomp.downcase
    counter = 1
      if department = Department.all.find {|dpt| dpt.name.downcase == input}
          Position.all.each_with_index do |pos, index| 
              if pos.department.name.downcase == input
                  puts "#{counter}. #{pos.name} - #{pos.department.name} in #{pos.office.name}" 
                  counter += 1
              else
              end
          end
      end
  end 
  
  def search_positions_by_name 
    puts "Please enter a position name to search for:"
    input = gets.chomp.downcase
    # if Position.find_by_name(input)
          test = Position.find_by_name(input)
          puts test
      # else 
      #     puts "No positions found."
      # end 
  end
    
  
end
