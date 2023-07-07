# frozen_string_literal: true

class PageHeading::Component < ApplicationComponent

  attr_reader :title

  renders_many :actions

  def initialize(title:)
    super()
    @title = title
  end

  def render?
    title.present?
  end

end
