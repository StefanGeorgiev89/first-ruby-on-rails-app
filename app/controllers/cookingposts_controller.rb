class CookingpostsController < ApplicationController
	#before_action :logged_in_user, only: [:create, :destroy]
	before_action :correct_user,   only: :destroy

  def create
    @cookingpost = current_user.cookingposts.build(cookingpost_params)
    if @cookingpost.save
      flash[:success] = "Cookingpost created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
  	@cookingpost.destroy
    flash[:success] = "Cookingpost deleted"
    redirect_to request.referrer || root_url
  end

  private

    def cookingpost_params
      params.require(:cookingpost).permit(:content, :picture)
    end

    def correct_user
      @cookingpost = current_user.cookingposts.find_by(id: params[:id])
      redirect_to root_url if @cookingpost.nil?
    end
end
