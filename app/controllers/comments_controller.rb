class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
  @ticket = Ticket.find(params[:ticket_id])
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

private

def comment_params
  params.require(:comment).permit(:content)
  end
end