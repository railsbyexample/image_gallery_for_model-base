##
# Renders previews for Devise (auth) transactional emails
class DeviseMailerPreview < ActionMailer::Preview
  def confirmation_instructions
    user = FactoryBot.build(:user, email: 'test@example.com')
    Devise::Mailer.confirmation_instructions(user, 'insertRandomTokenHere')
  end

  def email_changed
    user = User.new(email: 'test@example.com')
    Devise::Mailer.email_changed(user)
  end

  def reset_password_instructions
    user = User.new(email: 'test@example.com')
    Devise::Mailer.reset_password_instructions(user, 'insertRandomTokenHere')
  end

  def password_change
    user = User.new(email: 'test@example.com')
    Devise::Mailer.password_change(user)
  end

  def unlock_instructions
    user = User.new(email: 'test@example.com')
    Devise::Mailer.unlock_instructions(user, 'insertRandomTokenHere')
  end
end
