class CommentsController < ApplicationController
    before_action :find_commentable, only: [:create]
    before_action :set_comment, except: [:create]
    before_action :authenticate_user!

    def new
    end

    def create
        @comment = @commentable.comments.build(comment_params)
        @comment.user = current_user
        if params[:comment_id]
            @comment.reply = true
            @comment.save
        end
    end

    def edit
    end

    def update #only gets fired it you are doing a post call - only if patch or put
        # binding.pry
        if @comment.edit_history == ""
            #if \n => replace \n with <br/><hr/> so it looks nice
            @comment.edit_history = "Original: " + @comment.body.body.to_plain_text + "\n" #action text 
        else
            @comment.edit_history = @comment.edit_history + "Edit: " + params[:comment][:body] + "\n"
            @comment.update(comment_params)

        end
    end

    def destroy
    end

    def history
    end

    private
    def comment_params
        params.require(:comment).permit(:body)
    end

    def find_commentable
        if (params[:comment_id]) #reply to another comment
            @commentable = Comment.find_by_id(params[:comment_id]) #params to access forms and url query data
        elsif #comment on post
            @commentable = Post.friendly.find(params[:post_id])
        end
            
    end

end
