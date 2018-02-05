class Person < ActiveRecord::Base
  validates :name,presence:true
  validates :date_of_birth,presence:true
  validates :gender,presence:true
  validates :zipcode,presence:true
  validates_uniqueness_of :name


  def to_json
    super(:except => :password)
  end
end
