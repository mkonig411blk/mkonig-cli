require 'nokogiri'
require 'open-uri'
require 'pry'
 
require_relative './department.rb'
require_relative './office.rb'
require_relative './position.rb'
 
class Scraper
 
  def get_page
    Nokogiri::HTML(open("https://www.sweetgreen.com/careers/"))
  end
  
  def get_positions
    self.get_page.css.("tr")
  end
  
  def make_positions 
    self.get_positions.each do |position|
      position = Position.new 
      position.name = position.css("td.job_title").text
      position.department = position.css("td.job_department").text
      position.office = position.css("td.job_location").text
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