class CommentsController < ApplicationController
    def create
        @article = Article.find(params[:comment][:article_id])
        @comment = Comment.new(comment_params)
        @comment.user = current_user
        respond_to do |format|
          if @comment.save
            format.html { redirect_to article_path(@article.id), notice: "Comentario creado exitosamente" }
          else 
            format.html { redirect_to article_path(@article.id), notice: "No se pudo crear comentario" }
          end
        end
      end
      
      private
      
      def comment_params
        params.require(:comment).permit(:content, :article_id)
      end
end
