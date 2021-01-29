class OrderMailer < ApplicationMailer
  default from: 'project.red.shop@gmail.com'
  def complete_order
    @user = params[:user]
    mail(to: @user.email, subject: 'Order completed')
  end
end
