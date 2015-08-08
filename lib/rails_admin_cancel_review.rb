require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'

module RailsAdmin
  module Config
    module Actions
      class CancelReview < RailsAdmin::Config::Actions::Base

        RailsAdmin::Config::Actions.register(self)

        register_instance_option :visible? do
          # authorized? && bindings[:object].pending?
          bindings[:object].pending?
        end

        register_instance_option :member do
          true
        end

        register_instance_option :link_icon do
          'icon-ban-circle'
        end

        register_instance_option :controller do
          Proc.new do
            @object.canceled!
            flash[:notice] = "You have approved the review titled: #{@object.title}."
            redirect_to back_or_index
          end
        end

      end
    end
  end
end