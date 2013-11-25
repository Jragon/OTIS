class NationalOfficesController < InheritedResources::Base
  actions :index, :show

  def changes
    @changes = NationalOffice.find(params[:id]).changes_with_score

    render 'changes/index'
  end
end