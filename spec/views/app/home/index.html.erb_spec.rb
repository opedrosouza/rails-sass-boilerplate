# frozen_string_literal: true
require "rails_helper"

RSpec.describe "app/home/index.html.erb" do
  before do
    render
  end

  it "displays the user name" do
    expect(rendered).to have_content "Welcome to the boilerplate app!"
  end
end
