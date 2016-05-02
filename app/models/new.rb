# == Schema Information
#
# Table name: news
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  text          :text
#  date_publish  :datetime
#  admin_user_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class New < ActiveRecord::Base
  belongs_to :admin_user
end
