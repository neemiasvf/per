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

class Gene < ApplicationRecord
  belongs_to :user, inverse_of: :genes
  has_many :analyses, inverse_of: :gene

  validates :user_id, :name, :original_sequence, presence: true
  validates :name, uniqueness: { case_sensitive: false, scope: :user_id }

  before_save :treat_sequence

  # Polishes the original sequence for analysis purposes
  # 1. Cuts the sequence where the start codon "ATG" is found (everything before that is removed);
  # 2. Replaces all "U" nucleotides in the sequence for "T" ones.
  def treat_sequence
    unless self[:original_sequence].nil?
      self[:sequence] = self[:original_sequence][self[:original_sequence].index('ATG')..-1]
      self[:sequence].gsub!('U', 'T')
      self[:sequence].strip!
      self[:sequence].gsub!(/[^0-9a-z ]/i, '')
    end
  end

  def to_s
    name
  end
end
