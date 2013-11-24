class ConversationsController < InheritedResources::Base
  before_action :set_village

  def create
    create! do |success, failure|
      failure.html { redirect_to @discussion }
      success.html { redirect_to @discussion }
    end
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
    def set_village
      if params[:discussion_id]
        @discussion = Discussion.find(params[:discussion_id])
      end
    end

    def permitted_params
      params.permit(conversation: [:discussion_id, :change_name, :rank, :ten_seed, :observations])
    end
end