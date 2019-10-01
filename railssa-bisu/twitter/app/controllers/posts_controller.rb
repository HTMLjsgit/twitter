class PostsController < ApplicationController

    before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    before_action :is_mine, only: [:edit, :update, :destroy]

    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(create_params)
        @post.user_id = current_user.id
        @post.save
        redirect_to root_path
    end

    def edit
    end

    def update
        @post.update(create_params)
        redirect_to root_path
    end

    def destroy
        @post.destroy
        redirect_to root_path
    end

    def show
    end

    private
        def create_params
            params.require(:post).permit(:title, :body)
        end

        def set_post
            @post = Post.find params[:id]
        end

        def is_mine
          if @post.user_id != current_user.id
            redirect_to root_path
          end
        end
end