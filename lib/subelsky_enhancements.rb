cwd = File.dirname(__FILE__)

# Requiring this file loads up all the enhancements, which can also be cherry-picked 
# by requiring them individually.

%w(hash).each do |lib|
  require File.join(cwd,"subelsky_enhancements",lib)
end