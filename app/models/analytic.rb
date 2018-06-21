
class Analytic < ApplicationRecord

  def sort_by_tickets_completed
  #   @employees = Employee.all
  #   @employees_completed_tickets = {}
  #
  #   @employees.each do |employee|
  #     employee.tickets.each do |ticket|
  #       byebug
  #       if ticket.complete == true
  #
  #         if @employees_completed_tickets[employee] = nil
  #           @employees_completed_tickets[employee] = 1
  #         else
  #           @employees_completed_tickets[employee] += 1
  #         end
  #       end
  #
  #     end
  #   end
  #   @sorted_hash = @employees_completed_tickets.sort_by{|a,b| b}.reverse
  #
  # end
  @employee_ticket_hash = {}
  @employees.each do |employee|
    @count = Ticket.all.where(employee_id: employee.id, complete: true).count

    @employee_ticket_hash[Employee.find_by(id: employee.id).name] = @count
    # @sorted_hash = @employee_ticket_hash.sort_by{|a,b|, b}.reverse
  end

end
