class Department
  extend Memorable::ClassMethods
  extend Findable::ClassMethods
  include Memorable::InstanceMethods
  
  attr_accessor :name 
  
   @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
end