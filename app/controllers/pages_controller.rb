class PagesController < ApplicationController
  def letsencrypt
    render plain: "#{params[:id]}.0cAuYWq9SINUcNsUv1NUiPdVf1f9P7pCkAC_C4cax08"
  end
end
