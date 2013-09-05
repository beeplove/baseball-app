class League < ActiveRecord::Base
  belongs_to :season
  has_many :divisions, :dependent => :destroy

  attr_accessible :name, :season_id
end
