class HomesController < ApplicationController
  before_action :set_home, only: [:show, :edit, :update, :destroy, :vote]
  before_action :authenticate_user!, only: [:vote]
  before_action :authenticate_user!, except: [:index, :show]
  respond_to :js, :json, :html

  # GET /homes
  # GET /homes.json
  def index
    @homes = Home.all
  end

  # GET /homes/1
  # GET /homes/1.json
  def show
    @comments = @home.comments.all
    @comment = @home.comments.build
  end

  # GET /homes/new
  def new
    @home = current_user.homes.build
  end

  # GET /homes/1/edit
  def edit
  end

  # POST /homes
  # POST /homes.json
  def create
    @home = current_user.homes.build(home_params)

    respond_to do |format|
      if @home.save
        format.html { redirect_to @home, notice: 'Tag was successfully created.' }
        format.json { render :show, status: :created, location: @home }
      else
        format.html { render :new }
        format.json { render json: @home.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /homes/1
  # PATCH/PUT /homes/1.json
  def update
    respond_to do |format|
      if @home.update(home_params)
        format.html { redirect_to @home, notice: 'Tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @home }
      else
        format.html { render :edit }
        format.json { render json: @home.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /homes/1
  # DELETE /homes/1.json
  def destroy
    @home.destroy
    respond_to do |format|
      format.html { redirect_to homes_url, notice: 'Tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def vote
    if !current_user.liked? @home
      @home.liked_by current_user

    elsif current_user.liked? @home
      @home.unlike_by current_user
    end
    redirect_to @home
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_home
      @home = Home.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def home_params
      params.require(:home).permit(:imagem, :descricao, :nome)
    end
end
