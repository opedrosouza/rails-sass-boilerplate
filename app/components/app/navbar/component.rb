# frozen_string_literal: true

class App::Navbar::Component < ViewComponent::Base

  attr_reader :user

  def initialize(user: nil) # rubocop:disable Lint/MissingSuper
    @user = user
  end

end
