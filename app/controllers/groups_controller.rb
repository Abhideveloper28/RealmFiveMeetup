class GroupsController < ApplicationController
  require 'csv'

  before_action :set_group, only: [:show, :destroy, :edit, :update]

  def index
    @groups = Group.all.order('created_at DESC')
  end

  def show
    @users = @group.users
    @events = @group.events.order('role')
  end

  def create_group
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to @group
    else
      render 'edit'
    end
  end

  def destroy
    if @group.destroy
      flash[:notice] = "Successfully deleted group!"
    else
      flash[:alert] = "Error deleting group!"
    end
    respond_to do |format|
      format.html { redirect_to groups_path }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  def import
    begin
      CSV.foreach(params[:file].path, headers: true) do |row|
        data = row.to_hash
        user = User.get_user(data)
        group = Group.get_group(data)
        event = Event.new(user_id: user.id, group_id: group.id, role: data['Role in Group']&.downcase)
        event.save!
      end
      flash[:notice] = "Successfully import group!"
      redirect_to groups_path
    rescue => e
      flash[:error] = "Error " + e.message
      redirect_to create_group_path
    end
  end

  def download
    send_file sample_file_path, type: "application/csv", disposition: 'attachment'
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name)
  end

  def sample_file_path
    "#{Rails.root}/public/sample_csv.csv"
  end
end
