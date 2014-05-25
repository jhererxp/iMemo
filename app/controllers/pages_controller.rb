require 'carrierwave/orm/activerecord'
class PagesController < ApplicationController
	def index
		@latest_memos = Memo.last(5)
	end

	def show
		@memo = Memo.find(params[:id])
	end
end
