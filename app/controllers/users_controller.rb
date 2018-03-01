class UsersController < ApplicationController
  def index
    @users = User.all

    render("user_templates/index.html.erb")
  end

  def show
    @user = User.find(params.fetch("id_to_display"))

    render("user_templates/show.html.erb")
  end

  def edit_form
    @photo = Photo.find(params.fetch("prefill_with_id"))

    render("photo_templates/edit_form.html.erb")
  end

  def update_row
    @user = User.find(params.fetch(current_user.id))


    @user.email = params.fetch("user[email]")

    @user.username = params.fetch("user[username]")

    @user.password = params.fetch("user[password]")



    if @user.valid?
      @user.save

      redirect_to("/photos", :notice => "User updated successfully.")
    else
      render("/users/edit_form.html.erb")
    end

  end

  def destroy_row
    @photo = Photo.find(params.fetch("id_to_remove"))

    @photo.destroy


    redirect_to("/photos", :notice => "Photo deleted successfully.")

  end
end
