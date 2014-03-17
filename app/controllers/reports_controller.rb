class ReportsController < ApplicationController
  def index

  end

  def village
    @village = Village.find(params[:id])
    @changes = @village.changes_with_score

    @resource = @village
  end

  def national_office
    @national_office = NationalOffice.find(params[:id])
    @changes = @national_office.changes_with_score

    @resource = @national_office
  end

  def regional_office
    @regional_office = RegionalOffice.find(params[:id])
    @changes = @regional_office.changes_with_score
    
    @resource = @regional_office
  end

  def programme
    @programme = Programme.find(params[:id])
    @changes   = @programme.changes_with_score

    @resource  = @programme
  end

  def world_vision
    @changes     = Change.top.with_ten_seed
    @top_changes = Change.top.with_ten_seed.limit(3)
    @groups      = Group.all
  end
end
