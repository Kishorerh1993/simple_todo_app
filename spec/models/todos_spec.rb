require 'rails_helper'

RSpec.describe Todos, type: :model do

  it "is valid with user" do 
    user=User.new(:email => "duplicate@example.com", :password=>"123456").save
    todo = Todo.new(:title => "New", :completed => true ,:user_id =>user)
    expect(todo).to be_valid
  end
  it "is invalid without user" do 
    user=User.new(:email => "duplicate@example.com", :password=>"123456").save
    todo = Todo.new(:title => "New", :completed => false)
    expect(todo).to be_invalid
  end
end
