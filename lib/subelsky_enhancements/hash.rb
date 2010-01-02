# Slightly modified from 
#   * https://wincent.com/wiki/Fixtures_considered_harmful%3F
# By way of Topfunky's Peepcode Rspec screencasts

module HashEnhancement
  
  # Filter keys out of a Hash.
  #
  #   { :a => 1, :b => 2, :c => 3 }.except(:a)
  #   => { :b => 2, :c => 3 }

  def except(*keys)
    self.reject { |k,v| keys.flatten.include?(k || k.to_sym) }
  end

  # Returns a Hash with only the pairs identified by +keys+.
  #
  #   { :a => 1, :b => 2, :c => 3 }.only(:a)
  #   => { :a => 1 }

  def only(*keys)
    self.reject { |k,v| !keys.include?(k || k.to_sym) }
  end
  
end

unless Hash.instance_methods.include?(:except) || Hash.instance_methods.include?(:only)
  Hash.class_eval do
    include HashEnhancement
  end
end