require_relative "../concerns/findable.rb"
require_relative "../concerns/memorable.rb"

class Office
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
    @@all.each {|off| off.name}
  end
  
  def positions 
    Position.all.select do |pos|
      pos.office == self 
    end
  end
  
  def departments 
    departments = positions.map do |pos|
      pos.department
    end
    departments.uniq
  end
  
end