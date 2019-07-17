class FeedbacksController < ApplicationController
  protect_from_forgery with: :null_session
  def show
    url = feedback_params[:url]
    feedback_list = Feedback.where(url: url)
    render json: { status: 'ok', feedbacks: feedback_list }
  end

  def create
    require_params = feedback_params
    count_by_url = Feedback.where(url: require_params[:url]).count
    if count_by_url > 5
      Feedback.where(url: require_params[:url]).order(updated_at: :asc).first.tap do |feedback|
        feedback.text = require_params[:text]
        feedback.nickname = require_params[:nickname]
      end.save
    else
      Feedback.create(require_params)
    end
    render json: { status: 'ok' }
  end

  private

  def feedback_params
    params.require(:feedback).permit(:url, :nickname, :text)
  end
end
