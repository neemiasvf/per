class Gene < ApplicationRecord
  belongs_to :user, inverse_of: :genes

  validates :user_id, :name, :original_sequence, presence: true
  validates :name, uniqueness: { case_sensitive: false, scope: :user_id }
end
