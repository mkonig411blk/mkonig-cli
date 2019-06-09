require_relative "../concerns/findable.rb"
require_relative "../concerns/memorable.rb"

class Position
  extend Findable::ClassMethods
  extend Memorable::ClassMethods
  include Memorable::InstanceMethods
  
  attr_accessor :name, :department, :office
  
  @@all = []
  
  def initialize(name)
    @name = name
    save
  end
  
  def self.all
    @@all
  end
end
