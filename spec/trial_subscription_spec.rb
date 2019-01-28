require 'spec_helper'

RSpec.describe TrialSubscription do
  describe '#charge' do
    let(:credit_card) { double(:credit_card) }

    it 'does nothing' do
      expect(subject.charge(credit_card)).to eq(nil)
    end
  end

  describe '#has_mentoring?' do
    it 'returns true' do
      expect(subject.has_mentoring?).to be_truthy
    end
  end

  describe '#price' do
    it 'returns zero' do
      expect(subject.price).to eq(0)
    end
  end

  describe '#plan_name' do
    it 'returns "Free Trial"' do
      expect(subject.plan_name).to eq('Free Trial')
    end
  end
end
