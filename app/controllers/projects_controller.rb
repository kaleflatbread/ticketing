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
    @project = Project.new(project_params)
    if @project.valid?
      @project.save
      redirect_to @project
    else
      render :new
    end
  end

  def edit
    find_project
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to @project
    else
      render :edit
    end
  end

  def destroy
    find_project.destroy
  end

  private

    def find_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :description)
    end

end
