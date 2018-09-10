module UsersHelper

  def count
    User.all.count
  end

  def female_users
    User.female.count
  end

  def male_users
    User.male.count
  end

  def average
    User.average(:age)
  end

  def minimum
    User.minimum(:age)
  end

  def maximum
    User.maximum(:age)
  end
end
