class Registration < ActiveRecord::Base
  validates :person_id,presence:true
  validates :event_id,presence:true
  validates :status,presence:true
  validates_uniqueness_of :status, scope: %i[person_id event_id]


  def to_json
    super(:except => :password)
  end
end
