class ExampleMailer < ApplicationMailer
  default from: "foxhoundshield@gmail.com"

  def sample_email(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to the future")
  end
end
