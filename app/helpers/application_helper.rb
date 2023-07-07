# frozen_string_literal: true

module ApplicationHelper

  def user_avatar(user)
    if user.avatar.attached?
      image_tag(user.avatar, class: "w-8 h-8 rounded-full", alt: user.full_name)
    else
      vite_image_tag("images/user_avatar.svg", class: "w-10 h-10 rounded-full dark:bg-gray-300", alt: user.full_name)
    end
  end

  def component(name, *args, **kwargs, &)
    component = name.to_s.camelize.constantize::Component
    render(component.new(*args, **kwargs), &)
  end

  def page_title(title)
    content_for(:page_title) { title }
  end

  def page_actions(&)
    content_for(:page_actions) { capture(&) }
  end

end
