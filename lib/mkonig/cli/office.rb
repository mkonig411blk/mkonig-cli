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
end