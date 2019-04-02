class AdminController < ApplicationController
  before_action :logged_in_user, :authorized?

  private

  def authorized?
    return if current_user.admin?
    redirect_to current_user
  end
end
