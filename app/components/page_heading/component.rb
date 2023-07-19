# frozen_string_literal: true

class PageHeading::Component < ApplicationComponent

  attr_reader :title, :custom_classes

  renders_many :actions

  def initialize(title:, custom_classes: nil)
    super()
    @title = title
    @custom_classes = custom_classes
  end

  def render?
    title.present?
  end

end
