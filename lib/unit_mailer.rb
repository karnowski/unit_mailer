# TODO: extract these two monkey-patches into modules that 
# can be more elegantly included into these two classes as a
# "unit_mailer" gem, similar to unit_controller.
ActionMailer::Base.class_eval do
  @@rendered = nil
  @@render_email = true
  
  def render_with_unit_mailer(options)
    if @@render_email
      render_without_unit_mailer(options)
    else
      @@rendered = options
    end 
  end
  
  def self.do_not_render_email
    @@render_email = false
  end

  def self.render_email
    @@render_email = true
  end
  
  def self.rendered
    @@rendered
  end
  
  #TODO: choose a better signature and put in ActionMailer::TestCase
  def self.body_variable(var_name)
    @@rendered[:body][var_name]
  end
  
  #TODO: choose a better signature and put in ActionMailer::TestCase  
  def self.rendered_body
    @@rendered[:body]
  end
  
  alias_method_chain :render, :unit_mailer
end

class ActionMailer::TestCase
  teardown :reset_email_rendering
  
  #assert_passed_to_email_body
  #assert_rendered (but with diff name?)
  
  protected
  
  def reset_email_rendering
    ActionMailer::Base.render_email
  end
end