class HollasController < ApplicationController
  before_action :set_user, except: [:index, :show]
  before_action :set_holla, except: [:index, :new, :create]
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
    @holla = @user.hollas.new(holla_params)
    @holla.username = @user.user_name

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
    if @user
      if @holla.user == @user
        @holla.destroy
        respond_to do |format|
          format.html { redirect_to hollas_url, notice: 'Holla was successfully destroyed.' }
          format.json { head :no_content }
        end
      else
        render js: "alert('You dont own this post!')"
      end
    else
      render js: "alert('You need to be signed in in order to do that!')"
    end

  end

  def like
    if @user

      post = @user.likes?(@holla)
      if post
        post.destroy
      else
        Like.create!(user: @user, holla: @holla)
      end
    end

    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_holla
      @holla = Holla.find(params[:id])
    end

    def set_user
      @user = user_signed_in? ? current_user : nil
    end
    # Only allow a list of trusted parameters through.
    def holla_params
      params.require(:holla).permit(:body, :image)
    end
end
