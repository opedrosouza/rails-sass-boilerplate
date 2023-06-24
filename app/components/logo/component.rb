# frozen_string_literal: true

class Logo::Component < ViewComponent::Base

  attr_reader :image_path, :title, :custom_classes

  def initialize(image_path: nil, title: nil, custom_classes: nil) # rubocop:disable Lint/MissingSuper
    @image_path = image_path
    @title = title
    @custom_classes = custom_classes
  end

  def render?
    image_path.present? || title.present?
  end

end
