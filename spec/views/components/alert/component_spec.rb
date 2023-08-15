# frozen_string_literal: true

require "rails_helper"

describe Alert::Component do

  let(:options) { { message: Faker::Internet.email } }
  let(:component) { described_class.new(**options) }

  it "renders" do
    render_inline(component)

    expect(rendered_content).to have_css "div"
  end

end
