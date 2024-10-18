# frozen_string_literal: true

module Web
  module Profile
    class ApplicationController < ::Web::ApplicationController
      before_action :authenticate_user!
    end
  end
end
