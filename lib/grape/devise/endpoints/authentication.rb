require 'active_support/concern'

module Grape
  module Devise
    module Endpoints
      module Authentication
        extend ActiveSupport::Concern
        included do
          before do
            env['devise.mapping'] = ::Devise::Mapping.find_by_path!(request.path)
          end

          helpers do
            delegate :session, to: :request

            def auth_options
              {scope: resource_name}
            end

            # Gets the actual resource stored in the instance variable
            def resource
              instance_variable_get(:"@#{resource_name}")
            end

            # Proxy to devise map name
            def resource_name
              devise_mapping.name
            end

            alias :scope_name :resource_name

            # Proxy to devise map class
            def resource_class
              devise_mapping.to
            end

            # Attempt to find the mapped route for devise based on request path
            def devise_mapping
              @devise_mapping ||= env['devise.mapping']
            end

            include ::Devise::Controllers::SignInOut
          end

          ::Devise.mappings.keys.each do |mapping_name|
            resource mapping_name.to_s.pluralize do
              desc "Signs in #{mapping_name}"
              post 'sign_in' do
                env["devise.allow_params_authentication"] = true
                @resource = warden.authenticate auth_options
                if @resource
                  sign_in(resource_name, @resource)
                  @resource
                else
                  {error: warden.message}
                end
              end

              desc "Signs out current #{mapping_name}"
              delete 'sign_out' do
                signed_out = (::Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
                true
              end
            end
          end
        end
      end
    end
  end
end
