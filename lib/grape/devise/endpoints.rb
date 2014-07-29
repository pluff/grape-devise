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
