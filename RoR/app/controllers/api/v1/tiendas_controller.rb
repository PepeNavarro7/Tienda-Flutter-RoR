module Api
module V1
class TiendasController < ApplicationController
  skip_before_action :verify_authenticity_token

  # GET /tiendas or /tiendas.json
  def index
    render json: Tienda.all, status: :ok
  end

  # GET /tiendas/1 or /tiendas/1.json
  def show
  end

  # GET /tiendas/new
  def new
    @tienda = Tienda.new
  end

  # GET /tiendas/1/edit
  def edit
  end

  # POST /tiendas or /tiendas.json
  def create
    @tienda = Tienda.new(tienda_params)

    respond_to do |format|
      if @tienda.save
        format.html { redirect_to @tienda, notice: "Tienda creada correctamente." }
        format.json { render :show, status: :created, location: @tienda }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tienda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tiendas/1 or /tiendas/1.json
  def update
    respond_to do |format|
      if @tienda.update(tienda_params)
        format.html { redirect_to @tienda, notice: "Tienda editada correctamente." }
        format.json { render :show, status: :ok, location: @tienda }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tienda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tiendas/1 or /tiendas/1.json
  def destroy
    @tienda.destroy
    respond_to do |format|
      format.html { redirect_to tiendas_url, notice: "Tienda eliminada correctamente." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tienda
      @tienda = Tienda.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tienda_params
      params.require(:tienda).permit(:ubicacion)
    end
end
end
end
