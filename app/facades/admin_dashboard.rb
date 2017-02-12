class AdminDashboard 

  def initialize(user)
    @user = user
  end

  def chart_teaser
    @chart_teaser = "This is the Sun Sign for " + user.email 

    # @chart_teaser = current_user.chart.sun_sign.text
  end

  def users
    @users = "This will be a bunch of random users to draw in " + user.email

    # @users_rand = User.find(8, blah)
  end

  def celebs
    @celebs = "This will be a bunch of random celebs to draw in " + user.email

    # @users_rand = User.find(8, blah)
  end

  def match
    @match = "This will be a random match for " + user.email

    # @match = User.find(1).compare(current_user)
  end

  attr_reader :user

end