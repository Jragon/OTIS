class FruitsController < InheritedResources::Base
  respond_to :json, only: :update
  before_action :set_conversation

  def create
    create! do |success, failure|
      failure.html { redirect_to @conversatoin }
      success.html { redirect_to @conversation }
    end
  end

  def destroy
    destroy! { @conversation }
  end

  def update
    @fruit = Fruit.find(params[:id])
    @fruit.update_attributes(fruit_params)
    
    respond_with_bip(@fruit)
  end

  def sort
    params[:fruit].each_with_index do |id, index|
      Fruit.where("conversation_id = ?", @conversation.id).update_all({rank: index+1}, {id: id})
    end

    render nothing: true
  end

  protected
    def resource
      @last_rank = 0
      super
    end

  private
    def set_conversation
      if params[:conversation_id]
        @conversation = Conversation.find(params[:conversation_id])
      end
    end

    def permitted_params
      params.permit(:id)
    end

    def fruit_params
      params.require(:fruit).permit(:id, :conversation_id, :theme_name, :name, :rank, :ten_seed, :observations)
    end
end