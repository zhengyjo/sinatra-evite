class Event < ActiveRecord::Base
  validates :name,presence:true
  validates :date,presence:true
  validates_uniqueness_of :name


  def to_json
    super(:except => :password)
  end
end
