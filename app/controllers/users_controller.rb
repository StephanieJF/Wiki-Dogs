class UsersController < ApplicationController
  def show
    @wikis = Wiki.where(user_id: current_user.id)
  end

  def downgrade
    @user = current_user
    current_user.update_attribute(:role, 'standard')
    redirect_to users_show_path
  end
end
