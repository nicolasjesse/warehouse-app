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
      flash.now[:notice] = "Não foi possível cadastrar o Galpão."
      render 'new'
    end
  end

  def edit
    @warehouse = Warehouse.find(params[:id])
  end

  def update
    @warehouse = Warehouse.find(params[:id])
    warehouse_params = params.require(:warehouse).permit(:name, :code, :city, :description,
                                                         :address, :CEP, :area)

    if @warehouse.update(warehouse_params)
      flash[:notice] = "Galpão atualizado com sucesso."
      return redirect_to warehouse_path(@warehouse.id)
    else
      flash.now[:notice] = "Não foi possível atualizar o Galpão."
      render 'edit'
    end
  end
end
