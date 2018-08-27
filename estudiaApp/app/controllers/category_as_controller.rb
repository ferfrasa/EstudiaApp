class CategoryAsController < ApplicationController
  before_action :set_category_a, only: [:show, :edit, :update, :destroy]

  # GET /category_as
  # GET /category_as.json
  def index
    @category_as = CategoryA.all
  end

  # GET /category_as/1
  # GET /category_as/1.json
  def show
  end

  # GET /category_as/new
  def new
    @category_a = CategoryA.new
  end

  # GET /category_as/1/edit
  def edit
  end

  # POST /category_as
  # POST /category_as.json
  def create
    @category_a = CategoryA.new(category_a_params)

    respond_to do |format|
      if @category_a.save
        format.html { redirect_to @category_a, notice: 'Category a was successfully created.' }
        format.json { render :show, status: :created, location: @category_a }
      else
        format.html { render :new }
        format.json { render json: @category_a.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /category_as/1
  # PATCH/PUT /category_as/1.json
  def update
    respond_to do |format|
      if @category_a.update(category_a_params)
        format.html { redirect_to @category_a, notice: 'Category a was successfully updated.' }
        format.json { render :show, status: :ok, location: @category_a }
      else
        format.html { render :edit }
        format.json { render json: @category_a.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /category_as/1
  # DELETE /category_as/1.json
  def destroy
    @category_a.destroy
    respond_to do |format|
      format.html { redirect_to category_as_url, notice: 'Category a was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category_a
      @category_a = CategoryA.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_a_params
      params.require(:category_a).permit(:name, :color)
    end
end
