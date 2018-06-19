class ManagersController < ApplicationController

  def index
    @managers = Manager.all
  end

  def new
    @manager = Manager.new
  end

  def show
    find_manager
  end

  def create
    @manager = Manager.create(manager_params)
    redirect_to @manager
  end

  def edit
    find_manager
  end

  def update
    find_manager
    @manager.update(manager_params)
    redirect_to @manager
  end

  def destroy
    find_manager.destroy
  end

  private

    def find_manager
      @manager = Manager.find(params[:id])
    end

    def manager_params
      params.require(:manager).permit(:name, :title)
    end

end
