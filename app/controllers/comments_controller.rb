class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket
  before_action :set_comment, only: [:destroy]

  def create
    @comment = @ticket.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      Activity.create!(
        user: current_user,
        ticket: @ticket,
        action: "adicionou um comentário"
      )

      if @ticket.user != current_user
        Notification.create!(
          user: @ticket.user,
          ticket: @ticket,
          message: "#{current_user.email} comentou no seu chamado",
          read: false
        )
      end

      redirect_to @ticket, notice: "Comentário adicionado com sucesso."
    else
      redirect_to @ticket, alert: "Erro ao adicionar comentário."
    end
  end

  def destroy
    unless current_user == @comment.user || current_user.admin?
      return redirect_to @ticket, alert: "Você não tem permissão para excluir este comentário."
    end

    @comment.destroy
    redirect_to @ticket, notice: "Comentário excluído."
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end

  def set_comment
    @comment = @ticket.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
