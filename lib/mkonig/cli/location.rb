class Location
  # extend Findable::ClassMethods
  # extend Persistable::ClassMethods
  # include Persistable::InstanceMethods
  
  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    @name = name
    # save
  end
end