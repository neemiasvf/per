require 'rails_helper'

RSpec.describe Gene, type: :model do
  it { should belong_to(:user).inverse_of(:genes) }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of(:name).scoped_to(:user_id).case_insensitive }
  it { should validate_presence_of :original_sequence }
end
