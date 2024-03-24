# frozen_string_literal: true

require "rails_helper"

describe Button::Component do
  let(:options) { { value: "Click me" } }
  let(:component) { described_class.new(**options) }

  it "renders the Button component correctly" do
    render_inline(component)
    expect(rendered_content).to have_button "Click me", class: "button__component"
  end
end
