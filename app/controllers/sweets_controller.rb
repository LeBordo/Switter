class SweetsController < ApplicationController
  before_action :set_sweet, only: [:show, :edit, :update, :destroy]
  before_filter :load_swit
  # GET /sweets
  # GET /sweets.json
  def index
    @sweets = @swit.sweets.all
  end

  # GET /sweets/1
  # GET /sweets/1.json
  # def show
    # @swit.sweets.find(params[:id])
  # end

  # GET /sweets/new
  def new
    @sweet = @swit.sweets.new
  end

  # GET /sweets/1/edit
  def edit
  end

  # POST /sweets
  # POST /sweets.json
  def create
    @trueSweet = Sweet.where(swit_id: params[:swit_id], username: current_user.email).first
    
    if(@trueSweet!=nil)
      redirect_to swits_path
    else
      @sweet = @swit.sweets.new(sweet_params)

      respond_to do |format|
        if @sweet.save
          format.html { redirect_to swits_path }
          format.json { render action: 'show', status: :created, location: @sweet }
        else
          format.html { render action: 'new' }
          format.json { render json: @sweet.errors, status: :unprocessable_entity }
        end
      end  
    end
  end

  # DELETE /sweets/1
  # DELETE /sweets/1.json
  def destroy
    @sweet = @swit.sweets.find(params[:id])
    @sweet.destroy
    respond_to do |format|
      format.html { redirect_to swit_sweets_url(@swit) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sweet
      @sweet = Sweet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sweet_params
      params.require(:sweet).permit(:username)
    end

    def load_swit
      @swit = Swit.find(params[:swit_id])
    end
end
