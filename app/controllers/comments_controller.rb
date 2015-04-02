class CommentsController < ApplicationController

    before_action :authenticate_user!

    def create
        @link = get_link
        @comment = @link.comments.new comment_params
        @comment.user_id = current_user.id

        if @comment.save
            redirect_to @link
        else
            render 'form'
        end
    end

    def destroy
        @comment = get_comment

        if @comment.user === current_user
            @comment.destroy
        end

        redirect_to @comment.link
    end

    private

        def get_link
            Link.find params[:link_id]
        end

        def get_comment
            link = get_link
            link.comments.find params[:id]
        end

        def comment_params
            params.require(:comment).permit(:body)
        end

end
