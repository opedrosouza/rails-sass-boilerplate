# frozen_string_literal: true
require "rails_helper"

RSpec.describe "storefront/home/index.html.erb" do
  it "displays the title" do
    render
    expect(rendered).to have_content "Boilerplate"
  end
end
