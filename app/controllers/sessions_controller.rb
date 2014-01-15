class SessionsController < ApplicationController
  def new
  end

def create
  user = User.find_by(email: params[:session][:email].downcase)
  if user && user.authenticate(params[:session][:password])
  	sign_in user
    redirect_to user
    # Sign the user in and redirect to the user's show page.
  else
    flash.now[:error] = 'Invalid email/password combination' # Not quite right!
    render 'new'
    # Create an error message and re-render the signin form.

  end
end

  def destroy
  end
end