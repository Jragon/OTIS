class ThreatsController < InheritedResources::Base
  before_action :set_conversation
  respond_to :json, only: :update
  actions :create, :update

  def create
    create! do |success, failure|
      failure.html { redirect_to conversation_path(@conversation, anchor: "threats"), flash: { errors: @threat.errors.full_messages }, anchor: "threats" }
      success.html { redirect_to(:back, anchor: "#threats") }
    end
  end

  def update
    @threat = Threat.find(params[:id])
    @threat.update_attributes(threat_params)
    
    respond_with_bip(@threat)
  end

  protected
    def resource
      @last_rank = 0
      super
    end

    def permitted_params
      params.permit(:id, threat: [:conversation_id, :name, :rank, :observations])
    end

    def threat_params
      params.require(:threat).permit(:name, :rank, :observations)
    end

  private
    def set_conversation
      if params[:conversation_id]
        @conversation = Conversation.find(params[:conversation_id])
      else
        @conversation = Threat.find(params[:id]).conversation
      end
    end
end