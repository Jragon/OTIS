class ConversationsController < InheritedResources::Base
  respond_to :json, only: :update
  before_action :set_discussion, :set_last_rank

  def create
    create! do |success, failure|
      failure.html { redirect_to @discussion }
      success.html { redirect_to @discussion }
    end
  end

  def sort
    params[:conversation].each_with_index do |id, index|
      Conversation.where("discussion_id = ?", @discussion.id).update_all({rank: index+1}, {id: id})
    end

    render nothing: true
  end

  def update
    @conversatoin = Conversation.find(params[:id])
    @conversatoin.update_attributes(params[:conversatoin])
    
    respond_with_bip(@conversatoin)
  end

  def destroy
    destroy! { @discussion }
  end

  protected
    def collection
      if @discussion
        @conversations = @discussion.conversations
      else
        @conversations = Conversation.all
      end
    end

  private
    def set_discussion
      if params[:discussion_id]
        @discussion = Discussion.find(params[:discussion_id])
      else
        @discussion = Conversation.find(params[:id]).discussion
      end
    end

    def set_last_rank
      @last_rank = 0
    end

    def permitted_params
      params.permit(:id, conversation: [:discussion_id, :change_name, :rank, :ten_seed, :observations])
    end
end