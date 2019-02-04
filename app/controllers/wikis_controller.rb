class WikisController < ApplicationController
	def index
		@wikis = Wiki.all
	end

	def new
		@wiki = Wiki.new
	end

	def create
		@wiki = Wiki.new(wiki_params)
		@wiki.user = current_user

		if @wiki.save
			flash[:notice] = "Wiki saved"
			redirect_to @wiki
		else
			flash.now[:alert] = "Unable to save Wiki"
			render :new
		end
	end

	def show
		@wiki = Wiki.find(params[:id])
	end

	def edit
		@wiki = Wiki.find(params[:id])
	end

	def update
		@wiki = Wiki.find(params[:id])
		
		if @wiki.update_attributes(wiki_params)
			flash[:notice] = 'Wiki updated'
		else
			flash[:alert] = 'Unable to update wiki'
		end

		redirect_to @wiki

	end

	def destroy
		@wiki = Wiki.find(params[:id])

		if @wiki.destroy
			flash[:notice] = "Wiki removed"
		else
			flash[:alert] = "Unable to remove wiki"
		end

		redirect_to wikis_path
	end

	private
	def wiki_params
		params.require(:wiki).permit(:title, :body)
	end
end
