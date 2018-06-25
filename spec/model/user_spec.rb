require 'rails_helper'

describe User do

  #set user => factorybot
  let(:user) {FactoryBot.create :user}

  it 'can create'  do
    #expect()
    expect do
      FactoryBot.create :user
    end.to change{User.count}.by(1)#.from(0).to(1)
  end

  describe 'created user' do
    before do
      user
    end

    it 'can delete' do
      #delete user
      expect do
        User.last.destroy
      end.to change{ User.count }.by(-1)
    end

    it 'can update' do
      #edit user's email
      user.email = 'edited@email.com'
      user.save

      expect(user.reload.email).to eq('edited@email.com')
    end
  end

  #ซ้อนกันได้
  #describe 'address' do
  #end
end