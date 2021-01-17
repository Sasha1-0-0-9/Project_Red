class ApplicationController < ActionController::Base
  helper_method :current_category

  private

  def current_category
    @current_category = Category.find(@category.id)
  end
  helper_method :current_category
end
