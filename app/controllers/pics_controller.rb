class PicsController < ApplicationController
  before_action :set_pic, only: [:show, :edit, :update, :destroy, :updateTags]
  authorize_resource except: [:updateTags]

  # GET /pics
  # GET /pics.json
  def index
    if params[:tag]
      @pics = Pic.tagged_with(params[:tag]).page(params[:page]).per_page(64)
    else
      @pics = Pic.all.order(id: :desc).page(params[:page]).per_page(64)
    end
  end

  # GET /pics/1
  # GET /pics/1.json
  def show
  end

  # GET /pics/new
  def new
    @pic = current_user.pics.build
  end

  # GET /pics/1/edit
  def edit
  end

  # POST /pics
  # POST /pics.json
  def create
    @pic = current_user.pics.build(create_params)

    respond_to do |format|
      if @pic.save
        format.html { redirect_to edit_pic_path(@pic), notice: 'Pic was successfully uploaded. Enter more details.' }
        format.json { render :show, status: :created, location: @pic }
      else
        format.html { render :new }
        format.json { render json: @pic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pics/1
  # PATCH/PUT /pics/1.json
  def update
    respond_to do |format|
      if @pic.update(update_params)
        format.html { redirect_to @pic, notice: 'Pic was successfully updated.' }
        format.json { render :show, status: :ok, location: @pic }
      else
        format.html { render :edit }
        format.json { render json: @pic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pics/1
  # DELETE /pics/1.json
  def destroy
    @pic.destroy
    respond_to do |format|
      format.html { redirect_to pics_url, notice: 'Pic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def updateTags
    respond_to do |format|
      if @pic.update(tag_params)
        format.html { redirect_to @pic, notice: 'Tags were successfully updated.'}
      else
        format.json { render json: @pic.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pic
      @pic = Pic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def update_params
      params.require(:pic).permit(:title, :tag_list, :description)
    end

    def create_params
      params.require(:pic).permit(:title, :image)
    end

    def tag_params
      params.require(:pic).permit(:tag_list)
    end
end
