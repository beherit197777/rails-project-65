# frozen_string_literal: true

module ApplicationHelper
  def safe_paginate(collection, options = {})
    sanitize(paginate(collection, options))
  end

  def safe_time_ago_in_words(time)
    sanitize(time_ago_in_words(time))
  end

  def safe_button_to(name, options = {}, html_options = {})
    button_to(sanitize(name), options, html_options)
  end
end
