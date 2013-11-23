class ConversationsController < InheritedResources::Base
  before_action :set_village

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
      params.permit(conversation: [:discussion_id, :change_id, :rank, :ten_seed, :observations])
    end
end