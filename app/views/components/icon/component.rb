# frozen_string_literal: true

class Icon::Component < ApplicationViewComponent

  option :name, required: true
  option :size, optional: true, default: proc { 6 }
  option :color, optional: true, default: proc { "gray-800" }
  option :dark, optional: true, default: proc { "text-white" }

  def call
    send(:"#{name}").html_safe # rubocop:disable Rails/OutputSafety
  end

  def angle_down
    <<~ICON
      <svg class="w-#{size} h-#{size} text-#{color} dark:#{dark} #{custom_classes}" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m19 9-7 7-7-7"/>
      </svg>
    ICON
  end

  def angle_left
    <<~ICON
      <svg class="w-#{size} h-#{size} #{color} dark:#{dark} #{custom_classes}" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m15 19-7-7 7-7"/>
      </svg>
    ICON
  end

  def angle_right
    <<~ICON
      <svg class="w-#{size} h-#{size} #{color} dark:#{dark} #{custom_classes}" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m9 5 7 7-7 7"/>
      </svg>
    ICON
  end

  def angle_up
    <<~ICON
      <svg class="w-#{size} h-#{size} #{color} dark:#{dark} #{custom_classes}" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m5 15 7-7 7 7"/>
      </svg>
    ICON
  end

end
