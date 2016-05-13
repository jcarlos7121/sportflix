class Olap < ActiveRecord::Base
  self.primary_key = 'user_id'

  belongs_to :user
  belongs_to :payment
  belongs_to :user_event
end
