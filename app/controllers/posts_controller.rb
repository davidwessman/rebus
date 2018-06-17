class PostsController < ApplicationController
  def show
    @post = Post.find_by!(slug: params[:id])
    @questions = @post.questions 
  end
end
