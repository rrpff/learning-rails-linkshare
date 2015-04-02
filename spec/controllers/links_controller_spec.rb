require 'rails_helper'

RSpec.describe LinksController, type: :controller do

    describe 'GET index' do

        it 'should display recent links' do
            Link.create title: 'Google', url: 'http://google.com'

            visit '/links'
            page.should have_content 'Google'
        end

    end

    describe 'GET show' do

        it 'should display content of a link' do
            Link.create title: 'Giant Bomb', url: 'http://giantbomb.com'

            visit '/links/1'
            page.should have_content 'Giant Bomb'
            page.should have_content '0 Comments'
        end

    end

end