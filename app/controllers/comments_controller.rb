class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    film = Film.find(@comment.film_id)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to film, notice: "Ваш комментарий был успешно добавлен." }
        format.json { render json: @comment.id, status: :created }
      else
        format.html { redirect_to film, notice: @comment.errors }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:text, :user_id, :film_id)
    end
end
