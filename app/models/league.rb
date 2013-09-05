class League < ActiveRecord::Base
  belongs_to :season

  attr_accessible :name, :season_id
end
