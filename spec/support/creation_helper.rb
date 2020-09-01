module CreationHelper

    def user_signup
        fill_in("user[name]", :with => "Joey Bagalodonuts")
        fill_in("user[email", :with => "Joey@bagalodon.com")
        fill_in("user[password]", :with => "Joey")
        fill_in("user[password_confirmation]", :with => "Joey")
        click_button('Create User')
    end
end