require 'carrierwave/orm/activerecord'
class MemosController < ApplicationController
	def index
		@memos = Memo.all
	end

	def show
		@memo = Memo.find(params[:id])
	end

	def new
		@memo = Memo.new
	end

	def create
		m = Memo.new(memo_params)
		if m.save
			m.image = params[:file]
			redirect_to memos_path
			m.save!
		else
			message = @memo.errors.messages
			render :new
		end
		
		#m.image = File.open('public/uploads/memo/image')
		
		#m.image.url # => '/url/to/file.png'
		#m.image.current_path # => 'path/to/file.png'
		#m.image.identifier # => 'file.png'

		
	end

	def edit
		@memo = Memo.find(params[:id])
	end

	def update
		@memo = Memo.find(params[:id])
		if @memo.update(memo_params)
			redirect_to memos_path
		else
			message = @memo.errors.messages
			render :edit
		end
	end

	def destroy
		@memo = Memo.find(params[:id])
		@memo.destroy
		redirect_to memos_path
	end

	def memo_params
		params.require(:memo).permit!
	end
end
