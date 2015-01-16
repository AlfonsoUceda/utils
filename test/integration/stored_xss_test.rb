require 'integration_helper'

describe 'Stored XSS' do
  include Capybara::DSL

  it 'prevents stored attacks' do
    visit '/stored'
    find(:css, '#attack7').hover
    find(:css, '#attack8').hover
    find(:css, '#attack18').hover
    find(:css, '#attack19').click

    find(:target).text.must_be_empty
  end
end
