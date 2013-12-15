class ReportsController < ApplicationController
  def index

  end

  def village
    @village = Village.find(params[:id])
  end

  def national_office
  end

  def regional_office
  end

  def programme
  end

  def world_vision
  end
end
