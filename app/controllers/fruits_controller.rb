class FruitsController < InheritedResources::Base
  before_action :set_conversation

  def create
    create! do |success, failure|
      failure.html { redirect_to @conversatoin }
      success.html { redirect_to @conversation }
    end
  end

  def destroy
    destroy! { @conversation }
  end

  protected
    def resource
      @last_rank = 0
      super
    end

  private
    def set_conversation
      if params[:conversation_id]
        @conversation = Conversation.find(params[:conversation_id])
      end
    end

    def permitted_params
      params.permit(fruit: [:conversation_id, :name, :rank, :ten_seed, :observations])
    end
end