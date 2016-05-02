# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  category_id :integer
#  event_time  :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Event < ActiveRecord::Base
  has_many :user_events
  has_many :users, through: :user_events

  belongs_to :category
end
