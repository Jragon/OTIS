class ProgrammesController < InheritedResources::Base
  before_action :set_national_office

  def changes
    @changes = Programme.find(params[:id]).changes_with_score

    render 'changes/index'
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
      end
    end

    def permitted_params
      params.permit(programme: [:name, :number, :national_office_id])
    end
end