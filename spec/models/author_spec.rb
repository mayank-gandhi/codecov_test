require 'rails_helper'

RSpec.describe Author, type: :model do
  it { should have_many(:articles) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:password) }
end
