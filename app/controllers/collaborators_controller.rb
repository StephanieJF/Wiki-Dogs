class CollaboratorsController < ApplicationController
  def new
    @wiki = Wiki.find(params[:wiki_id])

    emails = [:emails_list]
    emails_list = emails.split ","

    emails_list.each do |email| #iterate on email addresses
      email = @user
      @wiki.collaborator(@user)
    end
  end
end
