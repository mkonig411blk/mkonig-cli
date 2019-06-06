require 'nokogiri'
require 'open-uri'
##require 'pry'
 
#require_relative './department.rb'
#require_relative './office.rb'
require_relative './position.rb'
 
class Scraper
 
  def get_page
    Nokogiri::HTML(open("https://www.sweetgreen.com/careers/"))
  end
  
  def get_rows
    self.get_page.css("tr")
  end
  
  def make_positions 
    self.get_rows.drop(1).each do |row|
        position = Position.new(row.css("td.job_title").text)
        position.department = row.css("td.job_department").text
        position.office = row.css("td.job_location").text
        ## at what point should I create instances of department and office? in scraper class or position class?
    end
  end
  
  def print_positions 
    self.make_positions 
    Position.all.each do |position|
      if position.name 
        puts "Name: #{position.name}"
        puts "Department: #{position.department}"
        puts "Office: #{position.office}"
      end
    end
  end
 
end
 
Scraper.new.print_positions