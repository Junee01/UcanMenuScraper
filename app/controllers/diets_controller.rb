require 'DongaSh'
require 'DongaBm'
require 'KwFoodCort'
require 'HanyangErica'

class DietsController < ApplicationController
  before_action :set_diet, only: [:show, :edit, :update, :destroy]

  # GET /diets
  # GET /diets.json
  def index
    @diets = Diet.all

    #TCP 요청을 보냈을 때, 페이지 자체 문제로 Failed이 나면, 복구하고 우선 다음 작업을 수행합니다. rescue의 역할입니다.
    
    #동덕여대
    # begin
    #  dongduk = Dongduk.new
    #  dongduk.scrape
    # rescue
    #   puts 'rescued.'
    # end
    
    #덕성여대
    begin
      duksung = Duksung.new
      duksung.scrape
    rescue
      puts 'rescued...'
    end

    #한성대
    begin
      hansung = Hansung.new
      hansung.scrape
    rescue
      puts 'rescued...'
    end

    #한양대 에리카
    begin
      hanyang_erica = HanyangErica.new
      hanyang_erica.scrape
    rescue
      puts 'rescued.'
    end

    #인하대
    begin
      inha = Inha.new
      inha.scrape
    rescue
      puts 'rescued.'
    end

    #명지대 인문캠퍼스
    begin
      mju = Mju.new
      mju.scrape
    rescue
      puts 'rescued.'
    end

    #삼육대
    begin
      syu = Syu.new
      syu.scrape
    rescue
      puts 'rescued.'
    end

    #동아대 승학캠퍼스
    begin
      dongash = DongaSh.new
      dongash.scrape
    rescue
      puts 'rescued.'
    end

    #동아대 구덕/부민캠퍼스
    begin
      dongabm = DongaBm.new
      dongabm.scrape
    rescue
      puts 'rescued.'
    end

    #광운대, 광운대 푸드코트
    begin
      kw = Kw.new
      kw.scrape
      kwfc = KwFoodCort.new
      kwfc.scrape
    rescue
      puts 'rescued.'
    end
  end

  # GET /diets/1
  # GET /diets/1.json
  def show
  end

  # GET /diets/new
  def new
    @diet = Diet.new
  end

  # GET /diets/1/edit
  def edit
  end

  # POST /diets
  # POST /diets.json
  def create
    @diet = Diet.new(diet_params)

    respond_to do |format|
      if @diet.save
        format.html { redirect_to @diet, notice: 'Diet was successfully created.' }
        format.json { render :show, status: :created, location: @diet }
      else
        format.html { render :new }
        format.json { render json: @diet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diets/1
  # PATCH/PUT /diets/1.json
  def update
    respond_to do |format|
      if @diet.update(diet_params)
        format.html { redirect_to @diet, notice: 'Diet was successfully updated.' }
        format.json { render :show, status: :ok, location: @diet }
      else
        format.html { render :edit }
        format.json { render json: @diet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diets/1
  # DELETE /diets/1.json
  def destroy
    @diet.destroy
    respond_to do |format|
      format.html { redirect_to diets_url, notice: 'Diet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diet
      @diet = Diet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def diet_params
      params.require(:diet).permit(:univ_id, :name, :location, :date, :time, :diet, :extra)
    end
end
