require 'date'
require_relative '../item'
require_relative '../book'

RSpec.describe Book do
  let(:publisher) { 'william-shakespeare' }
  let(:cover_state) { 'bad' }
  let(:publish_date) { '2021-03-07' }
  let(:archived) { true }

  subject { described_class.new(publisher, cover_state, publish_date, archived) }

  describe '#can_be_archived?' do
    context 'when the book is more than 10 years old' do
      let(:publish_date) { "#{Time.new.year - 11}-03-07" }

      it 'returns true' do
        expect(subject.can_be_archived?).to eq(true)
      end
    end

    context 'when the book is less than 10 years old' do
      let(:publish_date) { "#{Time.new.year - 9}-03-07" }

      it 'returns false' do
        expect(subject.can_be_archived?).to eq(true)
      end
    end

    context 'when the book cover state is bad' do
      let(:cover_state) { 'bad' }

      it 'returns true' do
        expect(subject.can_be_archived?).to eq(true)
      end
    end

    context 'when the book cover state is good' do
      let(:cover_state) { 'good' }

      it 'returns false' do
        expect(subject.can_be_archived?).to eq(false)
      end
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the book' do
      y = "<#{described_class} ID: #{subject.id}>" \
          "[Publisher: #{publisher}, Cover_state: #{cover_state}, publish_date: #{publish_date}, archive: #{archived}]"
      expect(subject.to_s).to eq(y)
    end
  end
end
