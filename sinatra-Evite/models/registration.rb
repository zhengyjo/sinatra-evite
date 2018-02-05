class Registration < ActiveRecord::Base
  validates :person_id,presence:true
  validates :event_id,presence:true
  validates :status,presence:true


  def to_json
    super(:except => :password)
  end
end
