class CollaboratorsController < ApplicationController
  def new
    @wiki = Wiki.find(params[:wiki_id])

    emails = [:emails_list]
    emails_list = emails.split ","

    emails_list.each do |email| #iterate on email addresses
      email = @user
      @wiki.collaborators.new(@user)  #add email address as a collaborator on the wiki
    end
  end
end
