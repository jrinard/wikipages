class ListingsController < ApplicationController
  def new
      @type = Type.find(params[:type_id])
      @listing = @type.listings.new
    end
    def create
      @type = Type.find(params[:type_id])
      @listing = @type.listings.new(listing_params)
      if @listing.save
        redirect_to type_path(@listing.type)
      else
        render :new
      end
    end
    def edit
      @type = Type.find(params[:type_id])
      @listing = Listing.find(params[:id])
      @types = Type.all
      render :edit
    end
    def update
      @type = Type.find(params[:type_id])
      @listing = Listing.find(params[:id])
      if @listing.update(listing_params)
        redirect_to type_path(@listing.type)
      else
        render :edit
      end
    end
    def destroy
      @type = Type.find(params[:type_id])
      @listing = Listing.find(params[:id])
      @listing.destroy
      redirect_to types_path
    end
  private
    def listing_params
      params.require(:listing).permit(:name, :address, :phone, :web, :hours, :type_id, :category)
    end
  end
