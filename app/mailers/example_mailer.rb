class ExampleMailer < ApplicationMailer
  default from: "foxhoundshield@gmail.com"

  def sample_email(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to the future")
  end

  def order_email(user, collection)
    @user = user
    @collection = collection
    mail(to: @user.email, subject: "Order detail from DBC shoppe")
  end
end
