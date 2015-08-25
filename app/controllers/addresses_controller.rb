class AddressesController < ApplicationController
  # before_action :set_address, only: [:show, :edit, :update, :destroy]
  # before_action :set_address_type

  # def create
  #   @address = current_user.addresses.build(address_params)
  #   if @address.save
  #     redirect_to edit_user_registration_url, notice: "#{address_type} was successfully created."
  #   else
  #     render :nothing
  #   end  
  # end

  # def update
  #   binding.pry 
  #   if @address.update_attributes(address_params)
  #     redirect_to edit_user_registration_url, notice: "#{address_type} was successfully updated."
  #   else
  #     render :nothing
  #   end
  # end

  # private

  # def set_address_type 
  #   @address_type = address_type
  # end

  # def address_type 
  #   # binding.pry
  #   Address.address_types.include?(params[:type])
  # end

  # def address_type_class 
  #   address_type.constantize 
  # end

  # def set_address
  #   @address = address_type_class.find(params[:id])
  # end

  # def address_params
  #   params.require(address_type.underscore.to_sym).permit(:address, :zip_code, :city, :phone, :country)
  # end

end