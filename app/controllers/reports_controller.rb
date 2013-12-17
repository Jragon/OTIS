class ReportsController < ApplicationController
  def index

  end

  def village
    @village = Village.find(params[:id])
    @changes = @village.changes_with_score

    @resource = @village
  end

  def national_office
  end

  def regional_office
    @regional_office = RegionalOffice.find(params[:id])
    @changes = @regional_office.changes_with_score
    
    @resource = @regional_office
  end

  def programme
  end

  def world_vision
  end
end
