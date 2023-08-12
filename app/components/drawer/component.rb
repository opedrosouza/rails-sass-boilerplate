# frozen_string_literal: true

class Drawer::Component < ApplicationComponent

  attr_reader :title, :description

  renders_one :body

  def initialize(title: nil, description: nil)
    super()
    @title = title
    @description = description
  end

end
