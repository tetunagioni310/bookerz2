class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top,:about]

  def after_sign_up_path_for(resource)
    user_path(current_user.id)
  end
  
  def after_sign_in_path_for(resource) 
    user_path(current_user.id)
  end
  
  def after_sign_out_path_for(resource)
    root_path
  end
  
  def current_user?(user)
    user == current_user
  end
end
