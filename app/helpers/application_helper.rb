module ApplicationHelper
  def home_controller?
    params[:controller].eql?('home')
  end
end
