class ContactsController < ApplicationController
  def new
    @user = current_user
    @profile = Profile
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      name = params[:contact][:name]
      email = params[:contact][:email]
      body = params[:contact][:message]

      ContactMailer.contact_email(name, email, body).deliver

      flash[:success] = ' Message sent'
      redirect_to new_contact_path
    else
      flash[:danger] = ' Your Message Was not Send, Please Insert Your Name And Email'
      redirect_to new_contact_path
    end
  end

  private
    def contact_params
      params.require(:contact).permit(:name, :email, :message)
    end
end

