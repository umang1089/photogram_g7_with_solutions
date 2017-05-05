class PicturesController < ApplicationController
  def new_form
    render("pic_templates/new_form.html.erb")
  end

  def create_row
    p = Photo.new
    p.source = params["the_source"]
    p.caption = params["the_caption"]
    p.save

    redirect_to("/photos")
  end

  def index
    @all_photos = Photo.order({:created_at => :desc})
    render("pic_templates/index.html.erb")
  end

  def show
    # The params hash looks like this: {"the_id_number"=>"1"}

    @id_number = params["the_id"]

    p = Photo.find(@id_number)

    @the_caption = p.caption
    @the_image_url = p.source
    @created_at = p.created_at

    render("pic_templates/show.html.erb")
  end

  def edit_form
    @the_photo_to_be_edited = Photo.find(params[:la_id])

    render("pic_templates/edit_form.html.erb")
  end

  def update_row
    p = Photo.find(params[:le_id])

    p.caption = params[:the_caption]
    p.source = params[:the_source]
    p.save

    redirect_to("/photos/"+params[:le_id])
  end

  def destroy_row
    id_number = params["da_id"]

    p = Photo.find(id_number)
    p.destroy

    redirect_to("/photos")
  end
end
