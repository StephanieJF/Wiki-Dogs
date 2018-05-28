class ChargesController < ApplicationController
  DEFAULT_AMOUNT = 15_00

  def new
    @stripe_btn_data = {
        key: "#{ Rails.configuration.stripe[:publishable_key] }",
        description: "Premium Membership - #{current_user.email}",
        amount: DEFAULT_AMOUNT
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
      amount: DEFAULT_AMOUNT,
      description: "Premium Membership - #{current_user.email}",
      currency: 'usd'
  )

  current_user.update_attribute(:role, 'premium')

  flash[:notice] = "You are now a Premium Member, #{current_user.email}!"
  redirect_to welcome_index_path # or wherever

    # Stripe will send back CardErrors, with friendly messages
    # when something goes wrong.
    # This `rescue block` catches and displays those errors.
rescue Stripe::CardError => e
  flash[:alert] = e.message
  redirect_to new_charge_path
end
end
