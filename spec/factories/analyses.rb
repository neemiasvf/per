# == Schema Information
#
# Table name: analyses
#
#  id                :bigint(8)        not null, primary key
#  gene_id           :bigint(8)
#  number_splices    :integer          default(1)
#  intron_min_length :integer          default(3)
#  intron_max_length :integer
#  exon_min_length   :integer          default(3)
#  exon_max_length   :integer
#  acceptor_cutoff   :float            default(2.2)
#  donor_cutoff      :float            default(4.5)
#  display_stop      :boolean          default(TRUE)
#  display_cu        :boolean          default(TRUE)
#  cu_size           :integer          default(20)
#  max_isoforms      :integer          default(10)
#  donors            :integer          is an Array
#  acceptors         :integer          is an Array
#  isoforms          :text             is an Array
#  queued_at         :datetime
#  started_at        :datetime
#  finished_at       :datetime
#  canceled_at       :datetime
#  status            :integer          default("New")
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

FactoryBot.define do
  factory :analysis do
    association :gene
  end
end
