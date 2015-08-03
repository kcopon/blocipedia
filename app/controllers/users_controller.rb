class UsersController < ApplicationController
   before_action :authenticate_user!
 
   def update
     if current_user.update_attributes(user_params)
       flash[:notice] = "User information updated"
       redirect_to edit_user_registration_path
     else
       flash[:error] = "Invalid user information"
       redirect_to edit_user_registration_path
     end
   end
 
   private
 
   def user_params
     params.require(:user).permit(:name)
   end

  def destroy
    customer = Stripe::Customer.retrieve(current_user.stripe_id)
    customer.subscriptions.retrieve(customer.subscriptions.first.id).delete
    redirect_to wikis_path
    current_user.update_attributes(stripe_id: nil, role: "member")
  end
end