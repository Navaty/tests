class StatementsController < ApplicationController
  before_action :set_statement, only: [:show, :edit, :update, :destroy]

  # GET /statements
  # GET /statements.json
  def index
    @statements = Statement.where("id LIKE ? AND email LIKE ? AND fio LIKE ?", "%#{params[:ticket_id]}%", "%#{params[:email]}%", "%#{params[:fio]}%")
   # @statements = Statement.all
  end

  # GET /statements/1
  # GET /statements/1.json
  def show
    #fonts = CombinePDF.new("#{Rails.root}/app/assets/images/font.pdf").fonts(true)
   
    #CombinePDF.register_font_from_pdf_object :time_new_roman, fonts[0]

  end

  # GET /statements/new
  def new
    @statement = Statement.new
    @test_id = params[:test_id]
  end

  # GET /statements/1/edit
  def edit
  end

  # POST /statements
  # POST /statements.json
  def create
    @statement = Statement.new(statement_params)

    path_to_file = "#{Rails.root}/app/assets/images/cert#{@statement.id}.pdf"
    pdf = CombinePDF.load "#{@statement.test.certificate.path}"

    #a = "Привет".encode("UTF-8")

# create a textbox and add it to the existing pdf on page 2 #{@statement.fio} #{@statement.position} 
    pdf.pages[0].textbox @statement.position, height: 60, width: 450, y: 400, x: 82, :font => :time_new_roman, font_color: [0, 0.2, 0.26274509803], max_font_size: 16
    pdf.pages[0].textbox @statement.place, height: 60, width: 450, y: 380, x: 82, :font => :time_new_roman, font_color: [0, 0.2, 0.26274509803], max_font_size: 16
  #Суспеснкого районе г . Казани ниже
    pdf.pages[0].textbox @statement.phone, height: 60, width: 450, y: 360, x: 82, :font => :time_new_roman, font_color: [0, 0.2, 0.26274509803], max_font_size: 16
    pdf.pages[0].textbox @statement.name, height: 60, width: 450, y: 320, x: 82, :font => :time_new_roman, font_color: [0, 0.2, 0.26274509803], max_font_size: 35
    pdf.pages[0].textbox @statement.fio, height: 60, width: 450, y: 280, x: 82, :font => :time_new_roman, font_color: [0, 0.2, 0.26274509803], max_font_size: 35
# output the new pdf which now contains your dynamic data
    pdf.save path_to_file
    File.open(path_to_file) do |f|
      @statement.certificate = f
    end
    File.delete(path_to_file) if File.exist?(path_to_file)

    respond_to do |format|
      if @statement.save
        format.html { redirect_to @statement, notice: 'Statement was successfully created.' }
        format.json { render :show, status: :created, location: @statement }
      else
        format.html { render :new }
        format.json { render json: @statement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /statements/1
  # PATCH/PUT /statements/1.json
  def update
    respond_to do |format|
      if @statement.update(statement_params)
        format.html { redirect_to @statement, notice: 'Statement was successfully updated.' }
        format.json { render :show, status: :ok, location: @statement }
      else
        format.html { render :edit }
        format.json { render json: @statement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /statements/1
  # DELETE /statements/1.json
  def destroy
    @statement.destroy
    respond_to do |format|
      format.html { redirect_to statements_url, notice: 'Statement was successfully destroyed.' }

    end
  end

  def update_certificate
    @statement = Statement.find(params[:id])
    @statement.certificate.remove!
    path_to_file = "#{Rails.root}/app/assets/images/cert#{@statement.id}.pdf"
    pdf = CombinePDF.load "#{@statement.test.certificate.path}"

    #a = "Привет".encode("UTF-8")

# create a textbox and add it to the existing pdf on page 2 #{@statement.fio} #{@statement.position} 
    pdf.pages[0].textbox @statement.position, height: 60, width: 450, y: 400, x: 82, :font => :time_new_roman, font_color: [0, 0.2, 0.26274509803], max_font_size: 16
    pdf.pages[0].textbox @statement.place, height: 60, width: 450, y: 380, x: 82, :font => :time_new_roman, font_color: [0, 0.2, 0.26274509803], max_font_size: 16
  #Суспеснкого районе г . Казани ниже
    pdf.pages[0].textbox @statement.phone, height: 60, width: 450, y: 360, x: 82, :font => :time_new_roman, font_color: [0, 0.2, 0.26274509803], max_font_size: 16
    pdf.pages[0].textbox @statement.name, height: 60, width: 450, y: 320, x: 82, :font => :time_new_roman, font_color: [0, 0.2, 0.26274509803], max_font_size: 35
    pdf.pages[0].textbox @statement.fio, height: 60, width: 450, y: 280, x: 82, :font => :time_new_roman, font_color: [0, 0.2, 0.26274509803], max_font_size: 35
# output the new pdf which now contains your dynamic data
    pdf.save path_to_file
    File.open(path_to_file) do |f|
      @statement.certificate = f
    end
    File.delete(path_to_file) if File.exist?(path_to_file)
    
    if @statement.save
      redirect_to @statement
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_statement
      @statement = Statement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def statement_params
      params.require(:statement).permit(:email, :fio, :phone, :position, :place, :name, :test_id, :notify, :paid, :certificate)
    end
end
