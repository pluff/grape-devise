require "grape/devise/endpoints/all"
require "active_support/concern"

module Grape
  module Devise
    module Endpoints
      extend ActiveSupport::Concern

      included do
        include Grape::Devise::Endpoints::Authentication
      end
    end
  end
end
