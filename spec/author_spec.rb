require_relative './spec_helper'

describe Author do 
    before :all do 
        @author = Author.new('Stephan', 'King')
        @book = Book.new("Publisher", "good", "2005-3-5", false)
    end

    describe "#new" do 
        it "should be an Author object" do 
            expect(@author).to be_an_instance_of Author 
        end

        it "should return correct name" do 
            expect(@author.first_name).to eql 'Stephan'
            expect(@author.last_name).to eql 'King'
        end
    end

    describe "#add_item" do 
        context "before adding any item" do 
            it "should have an empty list" do
                expect(@author.items.length).to eql 0 
            end
        end

        context "after adding a book" do 
            it "should contain exactly one item" do 
                @author.add_item(@book)
                expect(@author.items.length).to eql 1
            end

            it "should return the correct book" do 
                expect(@author.items[0]).to eql @book 
            end
        end
    end
end



