# frozen_string_literal: true

class Logo::Component < ApplicationViewComponent

  option :image_path, default: proc {}
  option :title, default: proc {}

  def render?
    image_path.present? || title.present?
  end

end
