# frozen_string_literal: true

class Modal::Component < ApplicationComponent

  attr_reader :title

  renders_one :body

  def initialize(title: nil, body: nil)
    super()
    @title = title
    @body = body
  end

end
