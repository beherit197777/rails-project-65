# frozen_string_literal: true

module Web
    class ApplicationController < ActionController::Base
      include AuthConcern
      include Pundit::Authorization
    end
end
