class Position
  extend Memorable::ClassMethods
  extend Findable::ClassMethods
  include Memorable::InstanceMethods
  
  attr_accessor :name, :department, :office 
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
end