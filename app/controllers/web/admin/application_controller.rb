# frozen_string_literal: true

module Web
  module Admin
    class ApplicationController < ::ApplicationController
      before_action :authenticate_admin!
    end
  end
end
