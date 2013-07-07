require 'modules/human_api_manager'
class DataFetcher
  @queue = :activity_queue
  def self.perform(user_id)
    user = User.find_by(id: user_id)
    # HumanApiManager.all_activity(user.humanapi_token)
    HumanApiManager.all_activity('447b182358048beeb2aed22a430704e8f3e29d36')
  end
end