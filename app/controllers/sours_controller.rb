class SoursController < ApplicationController
  before_action :set_sour, only: [:show, :edit, :update, :destroy]
  before_filter :load_swit
  # GET /sours
  # GET /sours.json
  def index
    @sours = @swit.sours.all
  end

  # GET /sours/1
  # GET /sours/1.json
  def show
    @swit.sours.find(params[:id])
  end

  # GET /sours/new
  def new
    @sour = @swit.sours.new
  end

  # GET /sours/1/edit
  def edit
  end

  # POST /sours
  # POST /sours.json
  def create
    @trueSour = Sour.where(swit_id: params[:swit_id], username: current_user.email).first

    if (@trueSour!=nil)
      redirect_to swits_path
    else
      @sour = @swit.sours.new(sour_params)

      respond_to do |format|
        if @sour.save
          format.html { redirect_to swits_path }
          format.json { render action: 'show', status: :created, location: @sour }
        else
          format.html { render action: 'new' }
          format.json { render json: @sour.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /sours/1
  # PATCH/PUT /sours/1.json
  def update
    @sour = @swit.sours.find(params[:id])
    respond_to do |format|
      if @sour.update(sour_params)
        format.html { redirect_to [@swit, @sour], notice: 'Sour was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sours/1
  # DELETE /sours/1.json
  def destroy
    @sour = @swit.sours.find(params[:id])
    @sour.destroy
    respond_to do |format|
      format.html { redirect_to swit_sours_path(@swit) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sour
      @sour = Sour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sour_params
      params.require(:sour).permit(:swit_id, :username)
    end

    def load_swit
        @swit = Swit.find(params[:swit_id])
    end

end
