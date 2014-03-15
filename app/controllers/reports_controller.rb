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

    @regional_groups = {}

    @regional_office.groups.each do |group|
      group_key = group.name.to_sym
      group.changes_with_score.each do |change|
        change_key = change.name.to_sym
        @regional_groups[group_key] ||= {}
        @regional_groups[group_key][change_key] ||= { score: 0, average_ten_seed: 0, name: change.name }
        @regional_groups[group_key][change_key][:score] += change.score 
        @regional_groups[group_key][change_key][:average_ten_seed] += change.average_ten_seed 
      end
    end

    @regional_groups.each do |group_key, group_value|
      @regional_groups[group_key] = group_value.values{ |k, v| v[:score] }.first(3)
    end


    @changes = @regional_office.changes_with_score
    
    @resource = @regional_office
  end

  def programme
  end

  def world_vision
  end
end
