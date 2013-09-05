class Season < ActiveRecord::Base
  has_many :leagues, :dependent => :destroy

  attr_accessible :year
end
