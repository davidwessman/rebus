class QuestionsController < ApplicationController
  def show
    @post = Post.find_by!(slug: params[:post_id])
    @question = @post.questions.find(params[:id])
  end

  def update
    @post = Post.find_by!(slug: params[:post_id])
    @questions = @post.questions.order(:id)
    @question = @post.questions.find(params[:id])
    @question.guess = guess

    unless @question.correct?
      render(:show)
    else
      redirect_answer(@post, @question)
    end
  end

  private

  def redirect_answer(post, question)
    idx = next_id(post, question)
    if idx == :done
      render(:answer)
    else
      redirect_to(post_question_path(post, idx))
    end
  end

  def next_id(post, question)
    ids = post.questions.order(:id).pluck(:id)
    idx = ids.index(question.id)
    if idx == ids.length - 1
      :done
    else
      ids[idx + 1]
    end
  end

  def guess
    params.require(:question).fetch(:guess, '')
  end
end
