# frozen_string_literal: true

require "rails_helper"

describe Link::Component do
  let(:options) { { path: "#", text: "Click me" } }
  let(:component) { described_class.new(**options) }

  it "renders the Link component correctly" do
    render_inline(component)
    expect(rendered_content).to have_link, text: "Click me"
  end
end
