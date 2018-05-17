=begin
require 'rails_helper'

RSpec.describe "analyses/index", type: :view do
  before(:each) do
    assign(:analyses, [
      Analysis.create!(
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
      ),
      Analysis.create!(
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
      )
    ])
  end

  it "renders a list of analyses" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 8.5.to_s, :count => 2
    assert_select "tr>td", :text => 9.5.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 10.to_s, :count => 2
  end
end
=end
