class ContactMailer < ApplicationMailer
  default from: "haydenbourgeois04@gmail.com"
  def sendNewEmail
    @first = params[:first]
    @last = params[:last]
    @subject = params[:subject]
    @address = params[:address]
    @message = params[:message]
    bootstrap_mail(to: "haydenbourgeois04@gmail.com", from: @address,subject: @subject)
  end
end
