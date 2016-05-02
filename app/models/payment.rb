# == Schema Information
#
# Table name: payments
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  month_reference :datetime
#  payment_date    :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Payment < ActiveRecord::Base
  belongs_to :user
end
