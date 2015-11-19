class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  
  # GET /products
  # GET /products.json

  # def search_by_category
  #   @products = Product.where(id: params[:category])
  #   redirect_to index
  # end

  def index
    if params[:category]
      @products = Product.where(category: params[:category]).all.paginate(:page => params[:page], :per_page => 6)
    else
      @products = Product.all.paginate(:page => params[:page], :per_page => 6)
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    authorize_owner(params[:id])

  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

    def authorize_owner(product_id)
      if user_signed_in?
        product_owner_id = Product.find(product_id).user_id
        if product_owner_id != current_user.id
          redirect_to products_path
        end
        # @products_owned = Product.where(:user_id => current_user.id)
      end
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :price, :amount, :detail, :user_id, :category, :picture)
    end


end
