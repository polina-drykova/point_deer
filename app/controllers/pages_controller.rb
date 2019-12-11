class PagesController < ApplicationController
  def home
  end

  def about
  end

  def contact
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:error] = nil
      redirect_to contact_path, notice: 'Your message has been sent'
    else
      flash.now[:error] = 'Cannot send message'
    end
  end
end
