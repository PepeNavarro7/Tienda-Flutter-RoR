class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]
  skip_before_action only: [:new, :create, :edit, :show, :destroy, :update] 


  # GET /clientes or /clientes.json
  def index
    @admin = Admin.all
  end

  
  # GET /clientes/1 or /clientes/1.json
  def show
  end

  
  # GET /clientes/1 or /clientes/1.json
  def edit
  end
  
  def update
    respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to @admin, notice: "Administrador editado correctamente." }
        format.json { render :show, status: :ok, location: @admin }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @admin.destroy
    respond_to do |format|
      format.html { redirect_to admins_url, notice: "Administrador borrado." }
      format.json { head :no_content }
    end
  end

  def new
   @admin = Admin.new
  end

  def create
    @admin = Admin.create(params.require(:admin).permit(:username, :password))
    redirect_to '/DS11/admins'
  end

  
  private

    # Only allow a list of trusted parameters through.
    def admin_params
      params.require(:admin).permit(:username, :email, :password)
    end

    def set_admin
      @admin = Admin.find(params[:id])
    end

end
