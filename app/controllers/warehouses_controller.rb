class WarehousesController < ApplicationController
  def show
    @warehouse = Warehouse.find(params[:id])
  end

  def new
    @warehouse = Warehouse.new
  end
  
  def create
    @warehouse = Warehouse.new(params.require(:warehouse)
                          .permit(:name, :code, :city, :description, :address, :cep, :area))
    if @warehouse.save
      flash[:notice] = "Galpão cadastrado com sucesso."
      return redirect_to root_path
    end
    render :new
  end
end