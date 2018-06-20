module SessionHelper

  def log_in_employee!(employee_id)
    session[:employee_id] = employee_id
  end

  def log_out_employee!
    session.delete(:employee_id)
  end

  def logged_in_employee_id_string
    session[:employee_id]
  end

  def logged_in?
    logged_in_employee_id_string.present?
  end

  def logged_in_employee_id_integer
    logged_in_employee_id_string.to_i
  end

  def logged_in_as_employee?(manager_id)
    manager_id != nil
  end

  def logged_in_as_manager?(manager_id)
    manager_id == nil
  end

  def logged_in_employee
    Employee.find_by(id: logged_in_employee_id_integer)
  end

end
