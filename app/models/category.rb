# == Schema Information
#
# Table name: categories
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  admin_user_id :integer
#

class Category < ActiveRecord::Base
  has_many :events

  belongs_to :admin_user
end
