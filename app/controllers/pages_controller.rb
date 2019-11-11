class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  skip_after_action :verify_policy_scoped, only: [:home]

  def home
  end

  def contact
  end

  def about
  end
end
