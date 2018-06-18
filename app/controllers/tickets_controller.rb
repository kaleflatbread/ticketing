class TicketsController < ApplicationController

  def index
    @tickets = Ticket.all
  end

  def new
    @ticket = Ticket.new
  end

  def show
    find_ticket
  end

  def create
    @ticket = Ticket.create(ticket_params)
  end

  def edit
    find_ticket
  end

  def update
    @ticket = Ticket.find(params[:id])
    @ticket.update(ticket_params)
  end

  def destroy
    find_ticket.destroy
  end

  private

    def find_ticket
      @ticket = Ticket.find(params[:id])
    end

    def ticket_params
      params.require(:ticket).permit(:name, :title)
    end

end
