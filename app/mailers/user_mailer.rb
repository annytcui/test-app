class UserMailer < ApplicationMailer

  def account_activation(user)
    @user = user
    mail to: user.email, subject: "PandaVisas: account activation"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "PandaVisas: password reset"
  end
end
