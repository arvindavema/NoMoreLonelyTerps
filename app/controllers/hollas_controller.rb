class HollasController < ApplicationController
  before_action :set_holla, only: [:show, :edit, :update, :destroy, :like, :hate]
  before_action :authenticate_user!, only: [:create, :edit,:update,:destroy, :like, :hate]
  # GET /hollas
  # GET /hollas.json
  def index
    @hollas = Holla.all
  end

  # GET /hollas/1
  # GET /hollas/1.json
  def show
  end

  # GET /hollas/new
  def new
    @holla = Holla.new
  end

  # GET /hollas/1/edit
  def edit
  end

  # POST /hollas
  # POST /hollas.json
  def create
    @holla = current_user.hollas.new(holla_params)
    @holla.username = current_user.user_name

    respond_to do |format|
      if @holla.save
        format.html { redirect_to @holla, notice: 'Holla was successfully created.' }
        format.json { render :show, status: :created, location: @holla }
      else
        format.html { render :new }
        format.json { render json: @holla.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hollas/1
  # PATCH/PUT /hollas/1.json
  def update
      respond_to do |format|
        if @holla.update(holla_params)
          format.html { redirect_to @holla, notice: 'Holla was successfully updated.' }
          format.json { render :show, status: :ok,  location: @holla }
        else
          format.html { render :edit }
          format.json { render json: @holla.errors,   status: :unprocessable_entity }
        end
      end
  end

  # DELETE /hollas/1
  # DELETE /hollas/1.json
  def destroy
    @holla.destroy
    respond_to do |format|
      format.html { redirect_to hollas_url, notice: 'Holla was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def like

    if current_user.likes.exists?(holla_id: @holla.id)
      current_user.likes.find_by(holla_id: @holla.id).destroy
    else
      Like.create!(user_id: current_user.id, holla_id: @holla.id)
    end
    redirect_to root_path
  end

  def hate

    if current_user.hates.exists?(holla_id: @holla.id)
      current_user.hates.find_by(holla_id: @holla.id).destroy
    else
      Hate.create!(user_id: current_user.id, holla_id: @holla.id)
    end
    redirect_to root_path
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_holla
      @holla = Holla.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def holla_params
      params.require(:holla).permit(:body, :image)
    end
end
