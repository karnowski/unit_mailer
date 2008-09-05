module SampleMailer
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

class SampleMailer1 < ActionMailer::Base
  include SampleMailer
end

class SampleMailer2 < ActionMailer::Base
  include SampleMailer  
end
