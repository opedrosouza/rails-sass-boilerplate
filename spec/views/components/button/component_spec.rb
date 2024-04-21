# frozen_string_literal: true

require "rails_helper"

describe Button::Component do
  describe "Basic Button" do
    let(:options) { { value: "Click me" } }
    let(:component) { described_class.new(**options) }

    it "renders the Button component correctly" do
      render_inline(component)
      expect(rendered_content).to have_button "Click me", class: "button__component", type: "button"
    end
  end

  describe "Button with path" do
    let(:options) { { value: "Click me", path: "/path" } }
    let(:component) { described_class.new(**options) }

    it "renders the Button component correctly" do
      render_inline(component)
      expect(rendered_content).to have_button "Click me", class: "button__component", type: "submit"
    end
  end

  describe "Button with outline style" do
    let(:options) { { value: "Click me", outline: true } }
    let(:component) { described_class.new(**options) }

    it "renders the Button component correctly" do
      render_inline(component)
      expect(rendered_content).to have_button "Click me", class: "button__component-outline", type: "button"
    end
  end
end
