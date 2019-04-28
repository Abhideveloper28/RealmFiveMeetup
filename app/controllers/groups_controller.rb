class GroupsController < ApplicationController

  before_action :set_group, only: [:show, :destroy]

  def index
    @groups = Group.all
  end

  def show
    @users = @group.users
    @events = @group.events
  end

  def destroy
    if @group.destroy
      flash[:notice] = "Successfully deleted group!"
      redirect_to groups_path
    else
      flash[:alert] = "Error deleting group!"
    end
  end

  private
  def set_group
    @group = Group.find(params[:id])
  end
end
