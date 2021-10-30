class ItemsController < ApplicationController
  def new 
    @item = Item.new
    @post = Post.find(params[:post_id])
  end
  
  def create
      @item = Item.new(item_params)
      if @item.save
        last_item = Item.last()
        flash[:notice] = 'Create successfully'
        redirect_to controller: :posts, action: :show, id: last_item.post_id
      else
        flash[:alert] = 'Not create successfully'
        @item = Item.new(item_params)
        redirect_to("/items/new/?post_id=#{@item.post_id}")
      end
  end
  
  private
  def item_params
    params.require(:item).permit(:post_id,:item_image, :products_name,:size,:price,:brand )
  end
end
