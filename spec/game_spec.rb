require_relative './spec_helper'

describe Game do
  before :all do
    @game = Game.new(publish_date: '2010-03-05', multiplayer: true, last_played_at: '2023-02-04', title: 'CSGO')
  end

  describe '#new' do
    it 'should be a Game object' do
      expect(@game).to be_an_instance_of Game
    end

    it 'should return the correct properties' do
      expect(@game.publish_date.to_s).to eql '2010-03-05'
      expect(@game.multiplayer).to be true
      expect(@game.last_played_at.to_s).to eql '2023-02-04'
    end
  end

  describe '#can_be_archived?' do
    context 'when last played date is less than 2 years' do
      it 'should return false' do
        expect(@game.can_be_archived?).to be false
      end
    end

    context 'when last played date is older than 2 years' do
      it 'should return true' do
        @game.last_played_at = Date.parse('2018-03-06')
        expect(@game.can_be_archived?).to be true
      end
    end

    context 'when published date is less than 10 years' do
      it 'should return false' do
        @game.publish_date = Date.parse('2020-03-05')
        expect(@game.can_be_archived?).to be false
      end
    end
  end
end
