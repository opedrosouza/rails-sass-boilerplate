# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def user_avatar(user, size: 8, classes: nil)
    if user.avatar.attached?
      image_tag(user.avatar, class: "w-#{size} h-#{size} rounded-full #{classes}", alt: user.full_name)
    else
      vite_image_tag("images/user_avatar.svg", class: "w-#{size} h-#{size} rounded-full bg-gray-300 #{classes}", alt: user.full_name)
    end
  end

  def page_title(title)
    content_for(:page_title) { title }
  end

  def page_actions(&)
    content_for(:page_actions) { capture(&) }
  end

  def pagination(pagy)
    return if pagy.pages <= 1

    tag.div(class: "flex justify-center items-center mt-5") do
      concat(pagy_nav(pagy).html_safe) # rubocop:disable Rails/OutputSafety
    end
  end
end
