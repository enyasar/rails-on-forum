class TopicsController < ApplicationController
  before_action :validate_user?, except: [:show]
  before_action only: [:edit, :update, :destroy] do
    validate_permission!(set_topic.user)
  end
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @forum = Forum.find(params[:forum_id])
    @topic = @forum.topics.new
  end

  def edit
  end

  def create
    @forum = Forum.find(params[:forum_id])
    @topic = @forum.topics.new(topic_params)
    @topic.user = current_user

    if @topic.save
      redirect_to topic_url(@topic), notice: 'Konu başarıyla oluşturuldu.'
    else
      render :new
    end
  end

  # PATCH/PUT /topics/1
  def update
    respond_to do |format|
      if @topic.update(topic_params)
        redirect_to topic_url(@topic), notice: 'Topic was successfully updated.'
      else
        render :edit
      end
    end
  end

  # DELETE /topics/1
  def destroy
    @topic.destroy
    redirect_to root_url, notice: 'Konu başarıyla silindi'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topic_params
      params.require(:topic).permit(:title, :body)
    end
end
