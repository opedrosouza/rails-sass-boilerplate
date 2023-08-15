# frozen_string_literal: true

require "rails_helper"

describe Logo::Component do

  let(:options) { { title: "Boilerplate" } }
  let(:component) { described_class.new(**options) }

  it "renders" do
    render_inline(component)

    expect(rendered_content).to have_css "h1"
  end

end
