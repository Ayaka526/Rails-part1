class BlogsController < ApplicationController
  	def top
  	end

  	def index
  		@blog = Blog.new
      @blogs = Blog.all.order(updated_at: :asc)
  	end

  	def create
      	 blog = Blog.new(blog_params)
        # DBへ保存する
      if blog.save
        flash[:success] = "Book was successfully created."
        redirect_to blog_path(blog.id)
      end
    end


  	def show
  		@blog = Blog.find(params[:id])
 	  end

  	def edit
  		@blog = Blog.find(params[:id])
  	end

  	def update
  		blog = Blog.find(params[:id])
      if blog.update(blog_params)
        flash[:notice] = "Book was successfully updated."
        redirect_to blog_path(blog)
      end

    end


 	  def destroy
        blog = Blog.find(params[:id])
        blog.destroy
        redirect_to blogs_path
    end

   private
    def blog_params
      params.require(:blog).permit(:title, :body)
    end

end
