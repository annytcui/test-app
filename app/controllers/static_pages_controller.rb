class StaticPagesController < ApplicationController
  def home
    @user = User.new
  end

  def blogs
  end

  def forum
  end
end
