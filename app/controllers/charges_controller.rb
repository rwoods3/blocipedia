class ChargesController < ApplicationController
	def new
		@stripe_btn_data = {
		 key: "#{ Rails.configuration.stripe[:publishable_key] }",
		 description: "Premium Blocipedia Membership - #{current_user.email}",
		 #amount: Amount.default
		 amount: 499
		}
	end

	def create
		# Creates a Stripe Customer object, for associating
		# with the charge
		customer = Stripe::Customer.create(
		 email: current_user.email,
		 card: params[:stripeToken]
		)

		# Where the real magic happens
		charge = Stripe::Charge.create(
		 customer: customer.id, # Note -- this is NOT the user_id in your app
		 amount: 50, #amount: Amount.default,
		 description: "Premium Blocipedia Membership - #{current_user.email}",
		 currency: 'usd'
		)

		flash[:notice] = "Upgraded to premium member, #{current_user.email}!"
		current_user.update_attribute(:role, User.roles['premium'])
		redirect_to edit_user_registration_path(current_user)

		# Stripe will send back CardErrors, with friendly messages
		# when something goes wrong.
		# This `rescue block` catches and displays those errors.
		rescue Stripe::CardError => e
		 flash[:alert] = e.message
		 redirect_to new_charge_path
		end
end
