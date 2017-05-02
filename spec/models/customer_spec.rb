require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe "is valid with first_name, last_name" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

  describe "associations" do
    it { should have_many(:invoices) }
    it { should have_many(:merchants).through(:invoices) }
  end
end
