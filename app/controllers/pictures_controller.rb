class PicturesController < ApplicationController
  def new_form
    render("pic_templates/new_form.html.erb")
  end

  def create_row
    render("pic_templates/create_row.html.erb")
  end

  def index
    @all_photos = Photo.order({:created_at => :desc})
    render("pic_templates/index.html.erb")
  end

  def show
    # The params hash looks like this: {"the_id_number"=>"1"}

    id_number = params["the_id"]

    p = Photo.find(id_number)

    @the_caption = p.caption
    @the_image_url = p.source
    @created_at = p.created_at

    render("pic_templates/show.html.erb")
  end

  def edit_form
    render("pic_templates/edit_form.html.erb")
  end

  def update_row
    render("pic_templates/update_row.html.erb")
  end

  def destroy_row
    render("pic_templates/destroy_row.html.erb")
  end
end
