# == Schema Information
#
# Table name: cards
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  cvv              :string(255)
#  expiration_date  :string(255)
#  card_number      :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  invoiced_ammount :float
#

class Card < ActiveRecord::Base
  belongs_to :user
end
