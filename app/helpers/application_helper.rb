# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def user_avatar(user, size: 8, classes: nil)
    if user.avatar.attached?
      image_tag(user.avatar, class: "w-#{size} h-#{size} rounded-full #{classes}", alt: user.full_name)
    else
      "<svg class='w-#{size} h-#{size} text-gray-800 dark:text-white rounded-full #{classes}' aria-hidden='true' xmlns='http://www.w3.org/2000/svg' width='#{size}' height='#{size}' fill='none' viewBox='0 0 24 24'>
        <path stroke='currentColor' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M12 21a9 9 0 1 0 0-18 9 9 0 0 0 0 18Zm0 0a8.949 8.949 0 0 0 4.951-1.488A3.987 3.987 0 0 0 13 16h-2a3.987 3.987 0 0 0-3.951 3.512A8.948 8.948 0 0 0 12 21Zm3-11a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z'/>
      </svg>".html_safe
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
