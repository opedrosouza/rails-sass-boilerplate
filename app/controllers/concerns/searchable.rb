# frozen_string_literal: true
module Searchable

  extend ActiveSupport::Concern

  included do
    helper_method :search_for
  end

  def search_for(record:, search_param: params[:search], order: "created_at DESC")
    return record.order(order) if search_param.blank?

    record.search(search_param).order(order)
  end

end
