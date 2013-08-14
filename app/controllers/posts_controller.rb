class PostsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
  	@post = current_user.posts.build(post_params)
  	if(params[:mild])
  		@post.severity = "Mild"
  	end
  	if(params[:moderate])
  		@post.severity = "Moderate"
  	end
  	if(params[:severe])
  		@post.severity = "Severe"
  	end
  	if @post.save
  		flash[:success] = "Symptom added!"
  		redirect_to root_url
  	else
  		@feed_items = {}
  		render 'static_pages/home'
  	end
  end

  def destroy
  	@post.destroy
  	redirect_to root_url
  end

  private

    def post_params
    	params.require(:post).permit(:symptom, :severity)
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end
end