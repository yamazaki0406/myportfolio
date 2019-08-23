require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

 test "layout links"do
   get root_path
   assert_template "static_pages/home"
   assert_select "a[href = ?]", about_path
   assert_select "a[href = ?]", signup_path
 end

end
