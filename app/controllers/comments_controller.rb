class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)
      if(@comment.save)
        flash[:success] = "Comment Posted."
      else
        flash[:danger] = @comment.errors.full_messages
      end
      redirect_to article_path(@article)
  end
  
  def destroy
      @article = Article.find(params[:article_id])
      @comment = @article.comments.find(params[:id])
      if ( @comment.destroy )
        flash[:success] = "Comment successfully destroyed."
      else
        flash[:danger] = @comment.errors.full_messages
      end
      
      redirect_to article_path(@article)
    end
  
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
