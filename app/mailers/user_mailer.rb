class UserMailer < ApplicationMailer
  def welcome(user)
    @user = user  # Instance variable => available in view

    mail(to: @user.email, subject: 'Bem vindo ao confia babá!')
    # This will render a view in `app/views/user_mailer`!
  end

  def booked(booking)
    @user = booking.user  # Instance variable => available in view
    @booking = booking
    mail(to: @user.email, subject: 'Dados da sua reserva!')
    # This will render a view in `app/views/user_mailer`!
  end

  def checkin(booking)
    @user = booking.user  # Instance variable => available in view
    @booking = booking
    mail(to: @user.email, subject: 'A babá fez o check-in!')
  end

  def checkout(booking)
    @user = booking.user  # Instance variable => available in view
    @booking = booking
    mail(to: @user.email, subject: 'A babá fez o check-out!')
  end
end
