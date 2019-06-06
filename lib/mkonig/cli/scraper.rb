require 'nokogiri'
require 'open-uri'
##require 'pry'
 
#require_relative './company.rb'
#require_relative './location.rb'
require_relative './position.rb'
 
class Scraper
 
  def get_page
    Nokogiri::HTML(open("https://www.indeed.com/jobs?q=engineer&l=Dallas%2C+TX"))
  end
  
  def get_rows
    self.get_page.css("div.jobsearch-SerpJobCard")
   
  end
   
  def make_positions 
    puts self.get_rows.count
    self.get_rows.each do |row|
      puts row.text
        position = Position.new(row.css(".column small-10").text)
        # position.location = row.css("h4.job-text").text
        # position.company = row.css("div.columns large-2 medium-3 small-12").text
        # position.type = row.css("h4.job-text employment-info").text
        # position.description = row.css("div.job-description show-for-medium-up").text
        # position.link = row.css(".information href").text
        # ## at what point should I create instances of department and office? in scraper class or position class?
        
        # puts position.location
        # puts position.company
        # puts position.type 
        # puts position.description
    end
    puts position
  end
  
  def print_positions 
    self.make_positions 
    puts Position.all.count
    Position.all.each do |position|
      if position.name 
        puts "Name: #{position.name}"
        puts "Department: #{position.department}"
        puts "Office: #{position.office}"
        puts "Req ID: #{position.id}"
        puts "Type: #{position.type}"
        puts "Description: #{position.description}"
        puts "Link: #{position.link}"
      end
    end
  end
 
end
 
Scraper.new.print_positions