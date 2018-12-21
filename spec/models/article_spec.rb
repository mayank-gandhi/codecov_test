require 'rails_helper'

RSpec.describe Article, type: :model do
  it { should belong_to(:author) }
  # it { is_expected.to validate_presence_of(:subject) }
  # it { is_expected.to validate_presence_of(:catagory) }
  # it { is_expected.to validate_presence_of(:description) }
end
