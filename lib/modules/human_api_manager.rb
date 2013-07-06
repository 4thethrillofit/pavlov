module HumanApiManager
  extend self
  def activity token
    HumanAPI::Human.token = token
    p HumanAPI::Human.all_activity
#    p HumanAPI::Human.activity "51d849e32b4164686200000a"
    p HumanAPI::Human.daily_activity Time.now.to_date - 10
    p HumanAPI::Human.series_activity Time.now.to_date - 10
  end
end
