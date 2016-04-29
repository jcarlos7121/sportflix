require 'rails_helper'

describe UserEvent, type: :model do
  it { is_expected.to belong_to :user }
  it { is_expected.to belong_to :event }
end
