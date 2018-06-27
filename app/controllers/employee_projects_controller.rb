class EmployeeProjectsController < ApplicationController
    private
    def employee_project_params
      params.require(:employee_project).permit(:employee_id, :project_id)
    end
end
