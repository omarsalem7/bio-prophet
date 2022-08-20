class LessonsController < ApplicationController
  before_action :set_chapter
  before_action :set_lesson, only: %i[show edit update destroy]
  PAGE_LIMIT = 2
  # GET chapters/1/lessons
  def index
    @page = (params[:page] || 0).to_i
    @lessons = @chapter.lessons.offset(PAGE_LIMIT * @page).limit(PAGE_LIMIT)
    @num_of_lessons=@chapter.lessons.count
  end

  # GET chapters/1/lessons/1
  def show; end

  # GET chapters/1/lessons/new
  def new
    @lesson = @chapter.lessons.build
  end

  # GET chapters/1/lessons/1/edit
  def edit; end

  # POST chapters/1/lessons
  def create
    @lesson = @chapter.lessons.build(lesson_params)

    if @lesson.save
      redirect_to([@lesson.chapter, @lesson], notice: 'تم إضافه الدرس بنجاح')
    else
      render action: 'new'
    end
  end

  # PUT chapters/1/lessons/1
  def update
    if @lesson.update(lesson_params)
      redirect_to([@lesson.chapter, @lesson], notice: 'تم تعديل الدرس بنجاح')
    else
      render action: 'edit'
    end
  end

  # DELETE chapters/1/lessons/1
  def destroy
    @lesson.destroy

    # redirect_to chapter_lessons_url(@chapter)
    respond_to do |format|
      format.html { redirect_to chapter_lessons_url(@chapter), notice: 'تم حذف الدرس بنجاح' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_chapter
    @chapter = Chapter.find(params[:chapter_id])
  end

  def set_lesson
    @lesson = @chapter.lessons.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def lesson_params
    params.require(:lesson).permit(:name, :content)
  end
end
