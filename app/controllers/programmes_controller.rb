class ProgrammesController < InheritedResources::Base
  before_action :set_national_office

  def create
    create! do |success, failure|
      failure.html { render "new" }
      success.html { redirect_to @programme }
    end
  end

  def destroy
    destroy! { @national_office }
  end

  protected
    def collection
      if @national_office
        @programmes = @national_office.programmes
      else
        @programmes = Programme.all
      end
    end  

  private
    def set_national_office
      if params[:national_office_id]
        @national_office = NationalOffice.find(params[:national_office_id])
      elsif params[:id]
        @national_office = Programme.find(params[:id]).national_office
      end
    end

    def permitted_params
      params.permit(programme: [:name, :number, :national_office_id])
    end
end