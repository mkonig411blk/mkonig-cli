require_relative "./environment.rb"
require_relative "./scraper.rb"
require_relative "./office.rb"
require_relative "./position.rb"
require_relative "./department.rb"
require_relative "../concerns/findable.rb"
require_relative "../concerns/memorable.rb"
require 'nokogiri'
#require 'pry'
require 'open-uri'

class Scraper

  def get_page
    Nokogiri::HTML(open("https://www.sweetgreen.com/careers/"))
  end

  def get_rows
    self.get_page.css("tr")
  end

  def make_classes
    self.get_rows.drop(1).each do |row|
      position_name = row.css("td.job_title").text
      department_name = row.css("td.job_department").text
      office_name = row.css("td.job_location").text
      position = Position.new(position_name)
      department = Department.find_or_create_by_name(department_name)
      office = Office.find_or_create_by_name(office_name)
      position.department = department
      position.office = office
    end
  end

  # def print_positions 
  #   self.make_classes
  # Position.all.each do |position|
  #     if position.name
  #       puts "Name: #{position.name}"
  #       puts "Department: #{position.department.name}"
  #       puts "Office: #{position.office.name}"
  #     # Department.all.each do |dpt|
  #     #   puts dpt.name
  #     # end
  #     # Office.all.each do |off|
  #     #   puts off.name 
  #     # end
  #     end
  #   end
  # end
  ## used for testing, not called in any other methods

end

# Scraper.new.print_positions 