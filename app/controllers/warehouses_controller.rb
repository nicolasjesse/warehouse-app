class WarehousesController < ApplicationController
    def show
        @warehouse = Warehouse.find(params[:id])
    end

    def new
        @warehouse = Warehouse.new
    end

    def create
        @warehouse = Warehouse.new(name: params[:warehouse][:name],
            description: params[:warehouse][:description],
            code: params[:warehouse][:code],
            city: params[:warehouse][:city],
            area: params[:warehouse][:area],
            address: params[:warehouse][:address],
            CEP: params[:warehouse][:CEP],
            )
    if @warehouse.save
        return redirect_to root_path
    end
    render :new
    end
end