class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: %i[show edit update destroy]

  def index
    @tickets = current_user.admin? ? Ticket.all : current_user.tickets

    if params[:query].present?
      @tickets = @tickets.where("title ILIKE ?", "%#{params[:query]}%")
    end

    if params[:status].present?
      @tickets = @tickets.where(status: params[:status])
    end

    if params[:priority].present?
      @tickets = @tickets.where(priority: params[:priority])
    end

    @tickets = @tickets.order(created_at: :desc)
  end

  def show
  end

  def new
    @ticket = current_user.tickets.new
  end

  def edit
  end

  def create
    @ticket = current_user.tickets.new(ticket_params)

    respond_to do |format|
      if @ticket.save
        Activity.create!(
          user: current_user,
          ticket: @ticket,
          action: "criou o chamado"
        )

        format.html { redirect_to @ticket, notice: "Ticket was successfully created." }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    old_status = @ticket.status
    old_priority = @ticket.priority
    old_assigned = @ticket.assigned_to&.email

    respond_to do |format|
      if @ticket.update(ticket_params)
        if old_status != @ticket.status
          Activity.create!(
            user: current_user,
            ticket: @ticket,
            action: "alterou status de #{old_status} para #{@ticket.status}"
          )
        end

        if old_priority != @ticket.priority
          Activity.create!(
            user: current_user,
            ticket: @ticket,
            action: "alterou prioridade de #{old_priority} para #{@ticket.priority}"
          )
        end

        if old_assigned != @ticket.assigned_to&.email
          Activity.create!(
            user: current_user,
            ticket: @ticket,
            action: "atribuiu responsável para #{@ticket.assigned_to&.email || 'ninguém'}"
          )
        end

        Activity.create!(
          user: current_user,
          ticket: @ticket,
          action: "atualizou o chamado"
        )

        format.html { redirect_to @ticket, notice: "Ticket was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ticket.destroy!

    respond_to do |format|
      format.html { redirect_to tickets_path, notice: "Ticket was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private

  def set_ticket
    if current_user.admin?
      @ticket = Ticket.find(params[:id])
    else
      @ticket = current_user.tickets.find(params[:id])
    end
  end

  def ticket_params
    params.require(:ticket).permit(
      :title,
      :description,
      :status,
      :priority,
      :assigned_to_id,
      attachments: []
    )
  end
end