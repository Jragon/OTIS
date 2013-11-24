class ThreatsController < InheritedResources::Base
  actions :create

  def create
    create! do |success, failure|
      failure.html { redirect_to conversation_fruit_path(Conversation.find(params[:conversation_id]), Fruit.find(params[:fruit_id])), flash: { errors: @threat.errors.full_messages } }
      success.html { redirect_to conversation_fruit_path(Conversation.find(params[:conversation_id]), Fruit.find(params[:fruit_id])) }
    end
  end

  protected
    def resource
      @last_rank = 0
      super
    end

    def permitted_params
      params.permit(threat: [:fruit_id, :name, :rank, :observations])
    end
end