# frozen_string_literal: true

class Auth::ConfirmationsController < Devise::ConfirmationsController

  layout "auth"
  # GET /resource/confirmation/new
  # def new
  #   super
  # end

  # POST /resource/confirmation
  # def create
  #   super
  # end

  # GET /resource/confirmation?confirmation_token=abcdef
  def show
    super do |resource|
      resource.owned_account.update!(active: true) if resource.owned_account.present? && !resource.owned_account.active?
      sign_in(resource) if resource.errors.empty? && resource.owned_account.present?
    end
  end

  # protected

  # The path used after resending confirmation instructions.
  # def after_resending_confirmation_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

  # The path used after confirmation.
  # def after_confirmation_path_for(resource_name, resource)
  #   super(resource_name, resource)
  # end

end
