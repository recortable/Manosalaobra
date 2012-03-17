ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "minitest/autorun"
require "capybara/rails"
require "active_support/testing/setup_and_teardown"

DatabaseCleaner.strategy = :truncation
class MiniTest::Spec
  include FactoryGirl::Syntax::Methods

  before :each do
    DatabaseCleaner.clean
  end

  LOGGER = Logger.new(STDOUT)
  def logger(&block)
    l = ActiveRecord::Base.logger
    ActiveRecord::Base.logger = LOGGER
    yield
    ActiveRecord::Base.logger = l
  end
end

class IntegrationTest < MiniTest::Spec
  include Rails.application.routes.url_helpers
  include Capybara::DSL

  register_spec_type(/integration$/, self)

  def login_user(user)
    if user.present?
      visit enter_path(user)
    else
      visit logout_path
    end
  end

  def click_submit
    page.find('input[name="commit"]').click
  end

  def visitable?(path)
    visit path
    page.current_path == path
  end
end

class HelperTest < MiniTest::Spec
  include ActiveSupport::Testing::SetupAndTeardown
  include ActionView::TestCase::Behavior

  register_spec_type(/Helper$/, self)
end

Turn.config.format = :outline

