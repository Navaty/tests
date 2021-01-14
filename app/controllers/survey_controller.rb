class SurveyController < ApplicationController
	 before_action :set_survey, only: [:show, :edit, :update, :destroy]

  # GET /surveys
  # GET /surveys.json
  def index
    @survey = Survey.all
  end

  # GET /surveys/1
  # GET /surveys/1.json
  def show
  end

  # GET /surveys/new
  def new
    #@survey = Survey.new
    @test = Test.find(params[:test_id])
  end

  # GET /surveys/1/editl
  def edit
  end

  # POST /surveys
  # POST /surveys.json
  def create
   # @survey = Survey.new()
    @test_id = params[:id]
    @score = 0
    @wrong_questions = Array.new
    @wrong_answers = Array.new
    @total = 0
    @survey = params[:survey]
    if !@survey.nil?
      @survey.each do |a, b|
        @total += 1
        answer = Answer.find(b)
        if(answer.correct)
          @score += 1
        else
          @wrong_questions << Question.find(a)
          @wrong_answers << b.to_i
        end
      end
    end
    summary = @score.to_f/@total*100
    if summary <70
      render :loser
    else
      @statement = Statement.new
      render :winer
    end

  end

  # PATCH/PUT /surveys/1
  # PATCH/PUT /surveys/1.json
  def update
    respond_to do |format|
      if @survey.update(survey_params)
        format.html { redirect_to @survey, notice: 'Survey was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey }
      else
        format.html { render :edit }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.json
  def destroy
    @survey.destroy
    respond_to do |format|
      format.html { redirect_to surveys_url, notice: 'Survey was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def survey_params
      params.require(:survey).permit(:email, :fio, :phone, :position, :test_id)
    end
end
