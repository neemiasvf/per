# == Schema Information
#
# Table name: genes
#
#  id                :bigint(8)        not null, primary key
#  name              :string
#  original_sequence :text
#  sequence          :text
#  user_id           :bigint(8)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'rails_helper'

RSpec.describe Gene, type: :model do
  it { should belong_to(:user).inverse_of(:genes) }
  it { should have_many(:analyses).inverse_of(:gene) }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of(:name).scoped_to(:user_id).case_insensitive }
  it { should validate_presence_of :original_sequence }
end
