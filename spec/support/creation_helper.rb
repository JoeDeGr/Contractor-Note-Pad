module CreationHelper

    def create_user
        user = User.new(name: "Johny Gongetsum", email: "Johnny@Johnny.com", password: "Johnny")
    end

    def user_signup
        fill_in("user[name]", :with => "Joey Bagalodonuts")
    end
end