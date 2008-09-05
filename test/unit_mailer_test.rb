require 'rubygems'
require 'test/spec'
require 'mocha'

require 'action_mailer'
require 'action_mailer/test_case'

require 'unit_mailer'
require 'sample_mailers'

describe "functional tests", ActionMailer::TestCase do
  it "creates a mail object without rendering the mailer's view" do
    SampleMailer1.do_not_render_email
    
    should.not.raise do 
      SampleMailer1.create_email(stub_everything(:email => "john@doe.com")) 
    end
  end

  #TODO: right now we're turning off ALL rendering for ALL mailers... not good
  xit "turning off rendering for one mailer should not affect any other mailer" do
    SampleMailer1.do_not_render_email
    
    should.raise(ActionView::TemplateFinder::InvalidViewPath) do
      SampleMailer2.create_email(stub_everything(:email => "john@doe.com"))
    end
  end
end
