require 'rails_helper'

describe Type do
  it { should validate_presence_of :category }
  # it { should have_many :tasks }
end
