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
    self.get_rows.each do |row|
      position = Position.new(row.css("td.job_title").text)
      position.department = row.css("td.job_department").text
      position.office = row.css("td.job_location").text
      department = Department.new(position.department) unless Department.all.include?(position.department)
      office = Office.new(position.office) unless Department.all.include?(position.office)
    end
  end

  def print_positions 
    self.make_classes
    # Position.all.each do |position|
    #   if position.name 
    #     puts "Name: #{position.name}"
    #     puts "Department: #{position.department}"
    #     puts "Office: #{position.office}"
      Department.all.each do |dpt|
        puts dpt.name
      end
      Office.all.each do |off|
        puts off.name 
      end
      # end
    # end
  end

end

Scraper.new.print_positions 