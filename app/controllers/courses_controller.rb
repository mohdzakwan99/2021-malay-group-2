class CoursesController < ApplicationController

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      flash[:success] = "Course successfully registered"
      redirect_to courses_url
    else
      flash[:danger] = "Course has failed to be registered!"
      render :new
    end
  end

  def index
    @courses = Course.all
  end

  def show; end

  def edit; end

  def destroy; end

  def update; end

  private

  def course_params
    params.require(:course).permit(:name, :description, :total_month, :total_member)
  end

end
