class ProductinfosController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user,   only: :destroy

  def index
    if params[:search]
      @productinfo = current_user.productinfos.find(:all, :conditions => ['category LIKE ?', "%#{params[:search]}"])
      redirect_to root_url
    else
      render 'static_pages/home'
    end

  end

  def create
  	@productinfo = current_user.productinfos.build(params[:productinfo])
  	if @productinfo.save
  		flash[:success] = "New Product created!"
  		redirect_to root_url
  	else
  		render 'static_pages/home'
  	end
  end

  def destroy
    @productinfo.destroy
    redirect_to root_url
  end

  private
  	def correct_user
      @productinfo = current_user.productinfos.find_by_id(params[:id])
      redirect_to root_url if @productinfo.nil?
    end
end