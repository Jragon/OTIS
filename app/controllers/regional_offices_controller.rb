class RegionalOfficesController < InheritedResources::Base
  actions :index, :show

  def changes
    @changes = RegionalOffice.find(params[:id]).changes_with_score

    render 'changes/index'
  end
end
