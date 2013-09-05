class Team < ActiveRecord::Base
  belongs_to :division

  attr_accessible :city, :name, :division_id
end
