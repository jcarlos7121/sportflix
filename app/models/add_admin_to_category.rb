class AddAdminToCategory < ActiveRecord::Base
  belongs_to :admin_user
end
