class DiscussionsController < InheritedResources::Base
  before_action :set_village

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
      end
    end

    def permitted_params
      params.permit(discussion: [:lead_facilitator, :duration, :date_held, :group_name, :village_id])
    end
end