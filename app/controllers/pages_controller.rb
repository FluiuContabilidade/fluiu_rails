class PagesController < ApplicationController

  def home_page
    @id = current_user.id
  end

end
