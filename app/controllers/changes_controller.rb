class ChangesController < InheritedResources::Base
  protected
    def collection
      @changes = Change.with_ten_seed.top
    end
end
