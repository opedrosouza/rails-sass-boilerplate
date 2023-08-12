# frozen_string_literal: true

class Icon::User::Component < ApplicationComponent

  attr_reader :type, :custom_classes

  def initialize(type: :add, custom_classes: nil)
    super()
    @type = type
    @custom_classes = custom_classes
  end

end
