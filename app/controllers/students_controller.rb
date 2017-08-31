class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
    @students = Student.all
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  def search
    @students = Student.all
  end

  def filter

    filter_option = params[:filter_option];
    search_query = params[:search_query];

    @students = Array.new

    if filter_option == "Name"
      @students = Student.where("name like ?", "%#{search_query}%");
    elsif filter_option == "Country"
      countries = Country.where("name like ?", "%#{search_query}%");
      countries.each do |country|
        @students = Student.where(country_id: country.id)
      end
    end

    respond_to do |format|
      format.js {}
      format.html {}
    end


  end

  def filter_cities
    #Get the id of the county we obatained from the client represented by the string
    country_id = Country.where(name: params[:country])
    cities = City.where(country_id: country_id)

    respond_to do |format|
      format.html {}
      format.json {render json: cities}
    end

  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_student
    @student = Student.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def student_params
    params.require(:student).permit(:name, :country_id, :city_id)
  end
end
