class ChangesController < InheritedResources::Base
  actions :index

  protected
    def collection
      @changes = Change.with_ten_seed.top
    end
end