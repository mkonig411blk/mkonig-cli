class Position
  # extend Findable::ClassMethods
  # extend Persistable::ClassMethods
  # include Persistable::InstanceMethods
  
  attr_accessor :name, :company, :location, :type, :description, :link
  
  @@all = []
  
  def initialize(name)
    @name = name
    # save
  end
  
  def self.all
    @@all
  end
  
   def self.create(name)
   end
end