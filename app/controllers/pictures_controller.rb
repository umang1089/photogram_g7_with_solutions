class PicturesController < ApplicationController
  def new_form
    render("pic_templates/new_form.html.erb")
  end

  def create_row
    p = Photo.new

    p.source = params[:the_source]
    p.caption = params[:the_caption]

    p.save

    @current_count = Photo.count

    redirect_to("/photos")
  end

  def index
    @list_of_photos = Photo.order(:created_at => :desc)

    render("pic_templates/index.html.erb")
  end

  def show
    @photo = Photo.find(params[:the_id])

    render("pic_templates/show.html.erb")
  end

  def edit_form
    @photo = Photo.find(params[:la_id])

    render("pic_templates/edit_form.html.erb")
  end

  def update_row
    p = Photo.find(params[:le_id])

    p.source = params[:the_source]
    p.caption = params[:the_caption]

    p.save

    @the_id = p.id

    redirect_to("/photos/#{@the_id}")
  end

  def destroy_row
    p = Photo.find(params[:da_id])

    p.destroy

    @remaining_count = Photo.count

    if @remaining_count == 0
      `rails db:seed`
    end

    redirect_to("/photos")
  end
end
