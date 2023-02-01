class HashtagsController < ApplicationController
  before_action :set_hashtag, only: %i[ show edit update destroy ]

  def index
    @hashtags = Hashtag.all
  end

  def show
  end

  def new
    @hashtag = Hashtag.new
  end

  def create
  end

  private
    def set_hashtag
      @hashtag = Hashtag.find(params[:id])
    end

    def hashtag_params
      params.fetch(:hashtag, {})
    end
end
