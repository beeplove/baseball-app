class Team < ActiveRecord::Base
  belongs_to :division
  has_many :players, :dependent => :destroy

  attr_accessible :city, :name, :division_id
end
