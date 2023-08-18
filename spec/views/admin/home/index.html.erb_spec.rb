# frozen_string_literal: true
require "rails_helper"

RSpec.describe "admin/home/index.html.erb" do

  before do
    render
  end

  it "displays the admin title" do
    expect(rendered).to have_content "Admin"
  end

end
