class Web::ContactController < ApplicationController
  def index
    if params[:commit] == "Email us!"
      ContactMailer.with(first: params[:first], last: params[:last], address: params[:address], subject: params[:subject], message: params[:message]).sendNewEmail.deliver_now
      redirect_to root_path
    end  
  end
end
