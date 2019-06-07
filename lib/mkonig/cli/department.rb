require_relative "../concerns/findable.rb"
require_relative "../concerns/memorable.rb"

class Department
  extend Findable::ClassMethods
  extend Memorable::ClassMethods
  include Memorable::InstanceMethods
  
  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
    @name = name
    save
  end
  
  def self.all
    @@all
  end
  
  def self.all_names
    @@all.each {|dept| dept.name}
  end
  
  def positions 
    Position.all.select do |pos|
      pos.department == self 
    end
  end
  
  def offices 
    offices = positions.map do |pos|
      pos.office
    end
    offices.uniq
  end
  
end