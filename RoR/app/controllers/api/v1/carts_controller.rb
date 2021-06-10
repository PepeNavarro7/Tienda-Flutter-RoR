module Api
module V1
class CartsController < ApplicationController
  skip_before_action :verify_authenticity_token

  # GET /carts or /carts.json
  def index
    render json: Cart.all, status: :ok
  end

  # GET /carts/1 or /carts/1.json
  def show
  end


 
  # GET /carts/1/edit
  def edit
  end

  # POST /carts or /carts.json
  def create
    @cart = Cart.new(cart_params)

      if @cart.save
        render json: @cart, status: :created
      else
	      render json: @cart.errors, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /carts/1 or /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: "Cart was successfully updated." }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1 or /carts/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: "Cart was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_params
      params.require(:cart).permit(:fecha, :tienda_id, :cliente_id, :recogida)
    end
end
end 
end
