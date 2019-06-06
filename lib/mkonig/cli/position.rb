class Position
  # extend Memorable::ClassMethods
  # extend Findable::ClassMethods
  # include Memorable::InstanceMethods
  
  attr_accessor :name, :department, :office 
  
  @@all = []
  
  def initialize

    @@all << self
  end
  
  def self.all
    @@all
  end
end