require 'integration_helper'

describe 'Reflected XSS' do
  include Capybara::DSL

  it 'prevents reflected attacks' do
    visit '/reflected?q=<script>xss(1)</script>'
    visit '/reflected?q=<script>window.onload = function() {xss(2)
    }</script>'
    visit '/reflected?q=%3cscript%3exss(3)%3c/script%3e'
    visit '/reflected?q=<scr<script>ipt>xss(4)</script>'
    visit '/reflected?q=<script&q=>xss(5)</&q=script>'

    find(:target).text.must_be_empty
  end
end
