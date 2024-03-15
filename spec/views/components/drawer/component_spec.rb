# frozen_string_literal: true

require "rails_helper"

describe Drawer::Component do
  let(:options) { { title: "My Drawer" } }
  let(:component) { described_class.new(**options) }

  it "renders" do
    render_inline(component)
    expect(rendered_content).to have_css "h5", text: "My Drawer"
  end
end
