class Probe < ActiveRecord::Base
  def happiness_bool?
    return true if happiness_bool == 't'
    return false
  end

end
