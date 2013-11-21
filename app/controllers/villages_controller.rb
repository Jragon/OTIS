class VillagesController < InheritedResources::Base
  before_action :set_programme

  protected
    def collection
      if @programme
        @villages = @programme.villages
      else
        @villages = Village.all
      end
    end  

  private
    def set_programme
      if params[:programme_id]
        @programme = Programme.find(params[:programme_id])
      end
    end

    def permitted_params
      params.permit(village: [:name, :programme_id])
    end
end