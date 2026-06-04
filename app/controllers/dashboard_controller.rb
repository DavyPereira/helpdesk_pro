class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @tickets = current_user.admin? ? Ticket.all : current_user.tickets

    @total_tickets = @tickets.count
    @open_tickets = @tickets.open.count
    @progress_tickets = @tickets.in_progress.count
    @resolved_tickets = @tickets.resolved.count
    @high_priority_tickets = @tickets.high.count

    @late_tickets = @tickets.select { |ticket| ticket.sla_status == "atrasado" }.count
    @due_soon_tickets = @tickets.select { |ticket| ticket.sla_status == "vencendo" }.count

    @recent_tickets = @tickets.order(created_at: :desc).limit(5)

    @tickets_by_status = @tickets.group(:status).count
    @tickets_by_priority = @tickets.group(:priority).count
    @tickets_by_day = @tickets.group_by_day(:created_at).count

    @tickets_by_sla = {
      "Atrasado" => @late_tickets,
      "Vencendo" => @due_soon_tickets,
      "No prazo" => @tickets.select { |ticket| ticket.sla_status == "no prazo" }.count,
      "Resolvido" => @tickets.select { |ticket| ticket.sla_status == "resolvido" }.count
    }
  end
end