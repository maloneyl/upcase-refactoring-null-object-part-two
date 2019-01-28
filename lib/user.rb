class User
  include ActiveModel::Model
  attr_accessor :created_at, :credit_card
  attr_writer :subscription

  FREE_TRIAL = 'Free Trial'

  def subscription
    @subscription || NoSubscription.new
  end

  def charge
    subscription.charge(credit_card)
  end

  def has_mentoring?
    free_trial? || subscription.has_mentoring?
  end

  def price
    return 0 if free_trial?

    subscription.price
  end

  def plan_name
    if free_trial?
      FREE_TRIAL
    else
      subscription.plan_name
    end
  end

  private

  def free_trial?
    created_at >= 30.days.ago
  end
end
