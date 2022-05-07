class WarehousesController < ApplicationController
  def show
    @warehouse = Warehouse.find(params[:id])
  end

  def new
    @warehouse = Warehouse.new
  end

  def create
    @warehouse = Warehouse.new(params.require(:warehouse).permit(:name, :code, :city, 
                                      :description, :address, :CEP, :area))
    if @warehouse.save
      flash[:notice] = "Galpão cadastrado com sucesso."
      return redirect_to root_path
    else
      flash[:notice] = "Não foi possível cadastrar o Galpão."
      render 'new'
    end
  end
end
