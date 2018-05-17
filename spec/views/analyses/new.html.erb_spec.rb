=begin
require 'rails_helper'

RSpec.describe "analyses/new", type: :view do
  before(:each) do
    assign(:analysis, Analysis.new(
      :number_splices => 1,
      :intron_min_length => 1,
      :intron_max_length => 1,
      :exon_min_length => 1,
      :exon_max_length => 1,
      :status => 1,
      :gene => nil,
      :acceptor_cutoff => 1.5,
      :donor_cutoff => 1.5,
      :display_stop => false,
      :display_cu => false,
      :cu_size => 1
    ))
  end

  it "renders new analysis form" do
    render

    assert_select "form[action=?][method=?]", analyses_path, "post" do

      assert_select "input[name=?]", "analysis[number_splices]"

      assert_select "input[name=?]", "analysis[intron_min_length]"

      assert_select "input[name=?]", "analysis[intron_max_length]"

      assert_select "input[name=?]", "analysis[exon_min_length]"

      assert_select "input[name=?]", "analysis[exon_max_length]"

      assert_select "input[name=?]", "analysis[status]"

      assert_select "input[name=?]", "analysis[gene_id]"

      assert_select "input[name=?]", "analysis[acceptor_cutoff]"

      assert_select "input[name=?]", "analysis[donor_cutoff]"

      assert_select "input[name=?]", "analysis[display_stop]"

      assert_select "input[name=?]", "analysis[display_cu]"

      assert_select "input[name=?]", "analysis[cu_size]"
    end
  end
end
=end
