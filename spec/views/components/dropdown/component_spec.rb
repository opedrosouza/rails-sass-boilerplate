# frozen_string_literal: true

require "rails_helper"

describe Dropdown::Component do
  let(:name) { "dropdown-1" }
  let(:button_text) { "Click me to drop" }
  let(:items) { [{ title: "Home", action: "/" }, { title: "Item 2", action: "#" }] }
  let(:options) { { name:, items:, button_text: } }
  let(:component) { described_class.new(**options) }

  before { render_inline(component) }

  it "renders the Dropdown component correctly" do
    aggregate_failures do
      expect(rendered_content).to have_css "div"
      expect(rendered_content).to have_css ".dropdown__component"
    end
  end

  context "when change the button text" do
    let(:button_text) { "New button text" }

    it "renders the Dropdown component with the correct button text" do
      expect(rendered_content).to have_content("New button text")
    end
  end

  context "when change the items" do
    let(:items) { [{ title: "Item 1", action: "#" }, { title: "Item 2", action: "#" }] }

    it "renders the Dropdown component with the correct items" do
      expect(rendered_content).to have_content("Item 1")
      expect(rendered_content).to have_content("Item 2")
    end
  end
end
