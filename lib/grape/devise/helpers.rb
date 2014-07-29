module Grape
  module Devise
    module Helpers
      def warden
        env['warden']
      end

      def current_user
        warden.user
      end

      def authenticate!
        handle_not_authenticated unless warden.authenticated?
      end

      def handle_not_authenticated
        error!('401 Unauthorized!', 401)
      end
    end
  end
end
