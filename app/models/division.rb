class Division < ActiveRecord::Base
  belongs_to :league
  has_many :teams, :dependent => :destroy

  attr_accessible :name, :league_id
end
