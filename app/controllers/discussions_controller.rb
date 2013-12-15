class DiscussionsController < InheritedResources::Base
  before_action :set_village

  def create
    create! do |success, failure|
      failure.html { redirect_to :back, flash: { errors: @discussion.errors.full_messages } }
      success.html { redirect_to :back }
    end
  end

  def update
    @discussion = Discussion.find(params[:id])
    @discussion.update_attributes(discussion_params)
    
    respond_with_bip(@discussion)
  end

  def destroy
    destroy! { [@village.programme, @village] }
  end

  protected
    def collection
      if @village
        @discussions = @village.discussions
      else
        @discussions = Discussion.all
      end
    end

    def resource
      @last_rank = 0
      super
    end

  private
    def set_village
      if params[:village_id]
        @village = Village.find(params[:village_id])
      elsif params[:id]
        @village = Discussion.find(params[:id]).village
      end
    end

    def permitted_params
      params.permit(discussion: [:lead_facilitator, :participants, :duration, :date_held, :group_name, :group_id, :village_id])
    end

    def discussion_params
      params.require(:discussion).permit(:lead_facilitator, :participants, :duration, :date_held, :group_name, :group_id, :village_id)
    end
end