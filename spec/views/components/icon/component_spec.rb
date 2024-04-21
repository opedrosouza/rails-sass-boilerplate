# frozen_string_literal: true

require "rails_helper"

describe Icon::Component do
  let(:name) { "angle_down" }
  let(:options) { { name: } }
  let(:component) { described_class.new(**options) }

  before { render_inline(component) }

  it "renders the Icon component correctly" do
    aggregate_failures do
      expect(rendered_content).to have_css "svg"
      expect(rendered_content).to have_css ".w-6"
    end
  end

  context "when change the size" do
    let(:options) { { name:, size: 10 } }

    it "renders the Icon component with the correct size" do
      aggregate_failures do
        expect(rendered_content).to have_css ".w-10"
        expect(rendered_content).to have_css ".h-10"
        expect(rendered_content).to have_no_css ".w-6"
      end
    end
  end
end
