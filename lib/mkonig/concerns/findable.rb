module Findable
  module ClassMethods
  def find_by_name(name)
    self.all.detect{|a| a.name == name}
  end
  
  def find_or_create_by_name(name)
      find_by_name(name) ? find_by_name(name) : new(name)
  end
end
end