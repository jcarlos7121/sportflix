require 'rails_helper'

describe User, type: :model do
  it { is_expected.to have_many :payments }
  it { is_expected.to have_many :user_events }
  it { is_expected.to have_many(:events).through(:user_events) }
end
