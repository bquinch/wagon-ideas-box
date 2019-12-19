class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if user_signed_in?
      redirect_to ideas_path
    end
  end

  def components
    @idea = Idea.all.sample
  end
end
