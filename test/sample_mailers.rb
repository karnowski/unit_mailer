class SampleMailer1 < ActionMailer::Base
  def email(user)
    recipients  user.email
    from        "bot@example.com"
    reply_to    "info@example.com"
    bcc         "thoughtpolice@example.com"
    subject     "Sweet, sweet email from us... your robotic pals."
    sent_on     Time.now
    @body[:user] = user
  end
end

class SampleMailer2 < ActionMailer::Base
  def email(user)
    recipients  user.email
    from        "bot@example.com"
    reply_to    "info@example.com"
    bcc         "thoughtpolice@example.com"
    subject     "Sweet, sweet email from us... your robotic pals."
    sent_on     Time.now
    @body[:user] = user
  end
end
