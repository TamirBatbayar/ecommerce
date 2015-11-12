class Master::RolesController < ApplicationController
  before_action :set_master_role, only: [:show, :edit, :update, :destroy]

  # GET /master/roles
  # GET /master/roles.json
  def index
    @master_roles = Master::Role.all
  end

  # GET /master/roles/1
  # GET /master/roles/1.json
  def show
  end

  # GET /master/roles/new
  def new
    @master_role = Master::Role.new
  end

  # GET /master/roles/1/edit
  def edit
  end

  # POST /master/roles
  # POST /master/roles.json
  def create
    @master_role = Master::Role.new(master_role_params)

    respond_to do |format|
      if @master_role.save
        format.html { redirect_to @master_role, notice: 'Role was successfully created.' }
        format.json { render :show, status: :created, location: @master_role }
      else
        format.html { render :new }
        format.json { render json: @master_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /master/roles/1
  # PATCH/PUT /master/roles/1.json
  def update
    respond_to do |format|
      if @master_role.update(master_role_params)
        format.html { redirect_to @master_role, notice: 'Role was successfully updated.' }
        format.json { render :show, status: :ok, location: @master_role }
      else
        format.html { render :edit }
        format.json { render json: @master_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /master/roles/1
  # DELETE /master/roles/1.json
  def destroy
    @master_role.destroy
    respond_to do |format|
      format.html { redirect_to master_roles_url, notice: 'Role was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_master_role
      @master_role = Master::Role.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def master_role_params
      params.require(:master_role).permit(:name)
    end
end
