class PostsController < ApplicationController

    def index 
        @posts = Post.all 
    end 

    def show 
        @post = Post.find(params[:id])
    end 

    def new 
        @post = Post.new 
    end 

    def create 
        @post = Post.new(post_params)

        if @post.save 
           redirect_to post_path(@post) 
        else 
            #flash[:super_sweet_errors] = artist.errors.full_messages
            redirect_to post_path(@post)
            #render :new 
        end 
    end 

    def edit 
        @post = Post.find(params[:id])
    end 
    
    def update
        @post = Post.find(params[:id])
        @post.update(post_params)
        
        if @post.save
            redirect_to post_path(@post)
        else 
            flash[:my_errors] = @post.errors.full_messages
            redirect_to edit_post_path(@post)
        end
    end 

    # def like
    #     @post = Post.find(params[:id])
    #     @post.likes += 1
    #     @post.save
    
    #     redirect_to post_path(@post)
    # end

    private 
    
        def post_params 
            params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
        end 

end

# t.string "title"
# t.text "content"
# t.integer "likes"
# t.integer "blogger_id"
# t.integer "destination_id"
