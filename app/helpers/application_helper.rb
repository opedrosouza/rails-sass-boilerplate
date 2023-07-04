# frozen_string_literal: true

module ApplicationHelper

  def user_avatar(user)
    if user.avatar.attached?
      image_tag(user.avatar, class: "w-8 h-8 rounded-full")
    else
      vite_image_tag("images/user_avatar.svg", class: "w-8 h-8 rounded-full")
    end
  end

  # rubocop:disable Naming/BlockForwarding
  def component(name, *args, **kwargs, &block)
    component = name.to_s.camelize.constantize::Component
    render(component.new(*args, **kwargs), &block)
  end
  # rubocop:enable Naming/BlockForwarding

end
