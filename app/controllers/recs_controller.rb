class RecsController < ApplicationController
  before_action :set_rec, only: [:show, :edit, :update, :destroy]

  # GET /recs
  # GET /recs.json
  def index
    @recs = Rec.all
  end

  # GET /recs/1
  # GET /recs/1.json
  def show
  end

  # GET /recs/new
  def new
    @rec = Rec.new
  end

  # GET /recs/1/edit
  def edit
  end

  # POST /recs
  # POST /recs.json
  def create
    @rec = Rec.new(rec_params)

    respond_to do |format|
      if @rec.save
        format.html { redirect_to @rec, notice: 'Rec was successfully created.' }
        format.json { render :show, status: :created, location: @rec }
      else
        format.html { render :new }
        format.json { render json: @rec.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recs/1
  # PATCH/PUT /recs/1.json
  def update
    respond_to do |format|
      if @rec.update(rec_params)
        format.html { redirect_to @rec, notice: 'Rec was successfully updated.' }
        format.json { render :show, status: :ok, location: @rec }
      else
        format.html { render :edit }
        format.json { render json: @rec.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recs/1
  # DELETE /recs/1.json
  def destroy
    @rec.destroy
    respond_to do |format|
      format.html { redirect_to recs_url, notice: 'Rec was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rec
      @rec = Rec.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rec_params
      params.require(:rec).permit(:value, :time, :tip)
    end
end
