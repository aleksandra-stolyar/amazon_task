require Rails.root.join('lib', 'rails_admin_approve_review.rb') 
require Rails.root.join('lib', 'rails_admin_cancel_review.rb') 

RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    approve_review do
      only ['Rating']
    end  
    cancel_review do
      only ['Rating']
    end
  end


  config.model 'Author' do
    object_label_method do
      :full_name
    end
    list do
      exclude_fields :created_at, :updated_at
    end
  end

  config.model 'Book' do
    list do
      exclude_fields :created_at, :updated_at
    end
# !!!!!!ВЕРНУТЬ ПОСЛЕ РЕЙТИНГОВ!!!!!!!!!!!
    # edit do
    #   group :default do
    #     field :ratings do
    #       hide
    #     end
    #   end
    #   include_all_fields
    # end
  end

  config.model 'Category' do
    list do
      exclude_fields :created_at, :updated_at
    end
  end

  config.model 'Order' do
    edit do
      field :status, :enum do
        default_value 'in_queue'
        enum do
          ['in_queue', 'in_delivery', 'delivered', 'canceled']
        end
      end
      include_all_fields
    end
    list do
      exclude_fields :order_items, :credit_card, :billing_address, :shipping_address
    end
  end
  
  config.model 'BillingAddress' do
    exclude_fields :addressable, :address_type, :user
  end
  
  config.model 'ShippingAddress' do
    exclude_fields :addressable, :address_type, :user
  end

  config.model 'CreditCard' do
    exclude_fields :cvv
  end

  config.model 'Rating' do
    edit do
      group :default do
        field :state do
          hide
        end
        field :text_review do
          hide
        end
      end
      include_all_fields
    end
  end





    ## With an audit adapter, you can add:
    # history_index
    # history_show

  
end
