class DiariesController < ApplicationController
  before_action :set_diary, only: %i[ show edit update destroy ]
  before_action :set_q, only: [:index, :search]
  
  
  # GET /diaries or /diaries.json
  def index
    @diaries = @q.result
  end
  # GET /diaries/1 or /diaries/1.json
  def show
    #@diary = Diary.find(params[:id])
  end

  # GET /diaries/new
  def new
    @diary = Diary.new
  end

  # GET /diaries/1/edit
  def edit
  end

  # POST /diaries or /diaries.json
  def create
    @diary = Diary.new(diary_params)

    respond_to do |format|
      if @diary.save
        format.html { redirect_to diary_url(@diary), notice: "日記の作成が完了しました。" }
        format.json { render :show, status: :created, location: @diary }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @diary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diaries/1 or /diaries/1.json
  def update
    respond_to do |format|
      if @diary.update(diary_params)
        format.html { redirect_to diary_url(@diary), notice: "日記が更新されました。" }
        format.json { render :show, status: :ok, location: @diary }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @diary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diaries/1 or /diaries/1.json
  def destroy
    @diary.destroy

    respond_to do |format|
      format.html { redirect_to diaries_url, notice: "日記を削除しました。" }
      format.json { head :no_content }
    end
  end
  
  def search
    @results = @q.result
  end
  
  private
  
    def set_q
    @q = Diary.ransack(params[:q])
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_diary
      @diary = Diary.find(params[:id])
      
    end

    # Only allow a list of trusted parameters through.
    def diary_params
      params.require(:diary).permit(:title, :body, :kept_at)
    end
end
