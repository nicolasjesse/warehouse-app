class WarehousesController < ApplicationController
  before_action :load_warehouse, only: [:show, :edit, :update, :destroy]

  def show; end

  def new
    @warehouse = Warehouse.new
  end

  def create
    @warehouse = Warehouse.new(warehouse_params)
    if @warehouse.save
      flash[:notice] = "Galpão cadastrado com sucesso."
      return redirect_to root_path
    else
      flash.now[:notice] = "Não foi possível cadastrar o Galpão."
      render 'new'
    end
  end

  def edit; end

  def update
    if @warehouse.update(warehouse_params)
      flash[:notice] = "Galpão atualizado com sucesso."
      redirect_to warehouse_path(@warehouse.id)
    else
      flash.now[:notice] = "Não foi possível atualizar o Galpão."
      render 'edit'
    end
  end

  def destroy
    @warehouse.delete
    flash[:notice] = "Galpão removido com sucesso."
    redirect_to root_path
  end

  private 

  def load_warehouse
    @warehouse = Warehouse.find(params[:id])
  end

  def warehouse_params
    params.require(:warehouse).permit(:name, :code, :city, :description,
                                      :address, :CEP, :area)
  end
end
