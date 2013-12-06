class ContributorsController < InheritedResources::Base
  before_action :set_conversation
  respond_to :json, only: :update
  actions :create, :update

  def create
    create! do |success, failure|
      failure.html { redirect_to @conversation, flash: { errors: @contributor.errors.full_messages } }
      success.html { redirect_to @conversation }
    end
  end

  def update
    @contributor = Contributor.find(params[:id])
    @contributor.update_attributes(contributor_params)
    
    respond_with_bip(@contributor)
  end

  protected
    def resource
      @last_rank = 0
      super
    end

    def permitted_params
      params.permit(:id, :conversation_id, contributor: [:conversation_id, :name, :rank, :observations])
    end

    def contributor_params
      params.require(:contributor).permit(:name, :rank, :observations)
    end

  private
    def set_conversation
      if params[:conversation_id]
        @conversation = Conversation.find(params[:conversation_id])
      else
        @conversation = Contributor.find(params[:id]).conversation
      end
    end
end