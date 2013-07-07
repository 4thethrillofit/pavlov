module HumanApiManager
  extend self

  def all_activity token
    HumanAPI::Human.token = token
    HumanAPI::Human.all_activity
  end

  def daily_activity token, date
    HumanAPI::Human.token = token
    HumanAPI::Human.daily_activity date
  end

  def series_activity token, date
    HumanAPI::Human.token = token
    HumanAPI::Human.series_activity date
  end

end
