require 'rails_helper'

describe Event, type: :model do
  it { is_expected.to have_many :user_events }
  it { is_expected.to have_many(:users).through(:user_events) }
  it { is_expected.to belong_to :category }
end
