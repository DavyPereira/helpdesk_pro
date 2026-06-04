class Api::V1::TicketsController < ActionController::API
  before_action :authenticate_api_user!

  def index
    tickets = current_api_user.admin? ? Ticket.all : current_api_user.tickets

    render json: tickets
  end

  def show
    ticket = find_ticket

    render json: ticket.as_json(
      include: {
        user: { only: [:id, :email] },
        assigned_to: { only: [:id, :email] },
        comments: {
          only: [:id, :content, :created_at],
          include: {
            user: { only: [:id, :email] }
          }
        }
      }
    )
  end

  def create
    ticket = current_api_user.tickets.new(ticket_params)

    if ticket.save
      render json: ticket, status: :created
    else
      render json: { errors: ticket.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    ticket = find_ticket

    if ticket.update(ticket_params)
      render json: ticket, status: :ok
    else
      render json: { errors: ticket.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
  ticket = find_ticket
  ticket.destroy!

  render json: { message: "Ticket excluído com sucesso." }, status: :ok
end

  private

  def authenticate_api_user!
    token = request.headers["Authorization"].to_s.split.last
    @current_api_user = User.find_by(api_token: token)

    render json: { error: "Não autorizado" }, status: :unauthorized unless @current_api_user
  end

  def current_api_user
    @current_api_user
  end

  def find_ticket
    if current_api_user.admin?
      Ticket.find(params[:id])
    else
      current_api_user.tickets.find(params[:id])
    end
  end

  def ticket_params
    params.require(:ticket).permit(
      :title,
      :description,
      :status,
      :priority,
      :assigned_to_id
    )
  end
end