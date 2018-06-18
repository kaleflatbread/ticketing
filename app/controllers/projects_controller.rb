class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def show
    find_project
  end

  def create
    @project = Project.create(project_params)
  end

  def edit
    find_project
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
  end

  def destroy
    find_project.destroy
  end

  private

    def find_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :title)
    end

end
