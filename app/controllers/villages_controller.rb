class VillagesController < InheritedResources::Base
  respond_to :json, only: :update
  before_action :set_programme

  def create
    create! do |success, failure|
      failure.html { redirect_to @programme, 
                     flash: { errors: @village.errors.full_messages }
                   }
      success.html { redirect_to [@programme.national_office, @programme] }
    end
  end

  def update
    @village = Village.find(params[:id])
    @village.update_attributes(village_params)
    
    respond_with_bip(@village)
  end

  def destroy
    destroy! { [@programme.national_office, @programme] }
  end

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
      elsif params[:id]
        @programme = Village.find(params[:id]).programme
      end
    end

    def permitted_params
      params.permit(village: [:name, :programme_id])
    end
    
   def village_params
      params.require(:village).permit(:name)
    end
end