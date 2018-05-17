=begin
require 'rails_helper'

RSpec.describe "analyses/show", type: :view do
  before(:each) do
    @analysis = assign(:analysis, Analysis.create!(
      :number_splices => 2,
      :intron_min_length => 3,
      :intron_max_length => 4,
      :exon_min_length => 5,
      :exon_max_length => 6,
      :status => 7,
      :gene => nil,
      :acceptor_cutoff => 8.5,
      :donor_cutoff => 9.5,
      :display_stop => false,
      :display_cu => false,
      :cu_size => 10
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/7/)
    expect(rendered).to match(//)
    expect(rendered).to match(/8.5/)
    expect(rendered).to match(/9.5/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/10/)
  end
end
=end
