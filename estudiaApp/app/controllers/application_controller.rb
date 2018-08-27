class ApplicationController < ActionController::Base
  before_action :set_categoriesA
  protect_from_forgery with: :exception

  protected
  #def authenticate_user! #ya est acon devise
   # redirect_to_root_path unless user_signed_in? && current_user.is_normal_user?
  #end
    
  def authenticate_editor!
    redirect_to root_path unless user_signed_in? && current_user.is_editor? 
  end

  def authenticate_admin!
    redirect_to root_path unless user_signed_in? && current_user.is_admin?
  end

  private

  def set_categoriesA
    @category_as = CategoryA.all #para que salga en todos los controladores
  end
  
end
