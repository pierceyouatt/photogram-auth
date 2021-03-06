class CommentsController < ApplicationController
  def index
    @comments = Comment.all

    render("comment_templates/index.html.erb")
  end

  def show
    @comment = Comment.find(params.fetch("id_to_display"))

    render("comment_templates/show.html.erb")
  end

  def new_form
    render("comment_templates/new_form.html.erb")
  end

  def create_row
    @comment = Comment.new


    @comment.photo_id = params.fetch("photo_id")

    @comment.body = params.fetch("body")

    @comment.user_id = params.fetch("user_id")



    if @comment.valid?
      @comment.save

      redirect_to("/comments", :notice => "Comment created successfully.")
    else
      render("comment_templates/new_form.html.erb")
    end

  end

  def create_photos_row
    @comment = Comment.new


    @comment.photo_id = params.fetch("photo_id")

    @comment.body = params.fetch("body")

    @comment.user_id = params.fetch("user_id")



    if @comment.valid?
      @comment.save

      redirect_to("/photos", :notice => "Comment created successfully.")
    else
      render("comment_templates/new_form.html.erb")
    end

  end

  def edit_form
    @comment = Comment.find(params.fetch("prefill_with_id"))

    render("comment_templates/edit_form.html.erb")
  end

  def update_row
    @comment = Comment.find(params.fetch("id_to_modify"))


    @comment.photo_id = params.fetch("photo_id")

    @comment.body = params.fetch("body")

    @comment.user_id = params.fetch("user_id")



    if @comment.valid?
      @comment.save

      redirect_to("/comments/#{@comment.id}", :notice => "Comment updated successfully.")
    else
      render("comment_templates/edit_form.html.erb")
    end

  end

  def destroy_row
    @comment = Comment.find(params.fetch("id_to_remove"))

    @comment.destroy


    redirect_to("/comments", :notice => "Comment deleted successfully.")

  end
end
