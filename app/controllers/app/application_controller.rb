# frozen_string_literal: true

class App::ApplicationController < ApplicationController

  before_action :authenticate_user!

end
