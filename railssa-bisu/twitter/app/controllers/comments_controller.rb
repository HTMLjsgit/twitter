class CommentsController < ApplicationController

	before_action :params_d, only:[:destroy,:show,:edit]

	def index
		@comment = Comment.all
	end
	def new
		@comment = Comment.new
	end
	def create
		@comment = Comment.new
		@comment.body = params[:body]
		@comment.post_id = params[:post_id][:value].to_i
		@comment.save
		redirect_to post_path(params[:post_id])
	end
	
	def destroy
		@comment.destroy
		redirect_to post_path(params[:post_id])
	end
		private
		def params_d
		Comment.find params[:id]
		end

end
