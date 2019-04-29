module ApplicationHelper
  def home_controller?
    params[:controller].eql?('home')
  end

  def groups_index_action?
    (params[:controller] == 'groups') && (params[:action] == 'index')
  end
end
