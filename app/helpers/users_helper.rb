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

  def first_name_sort(order)
      User.all.order(first_name: :"#{order}")
  end

  def last_name_sort(order)
      User.all.order(last_name: :"#{order}")
  end

  def city_sort(order)
    Address.all.order(city: :"#{order}")
  end

  def age_select(min, max)
    User.where('age <= ? and age >= ?', max, min)
  end
end
