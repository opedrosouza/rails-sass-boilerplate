# frozen_string_literal: true

require "rails_helper"

describe Modal::Component do
  let(:options) { { title: "My modal" } }
  let(:component) { described_class.new(**options) }

  it "renders" do
    render_inline(component)
    expect(rendered_content).to have_css "h3", text: "My modal"
  end
end
