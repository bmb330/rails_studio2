require 'spec_helper'

describe "Deleting a user" do
	before do
		@admin = User.create!(user_attributes(admin: true, username: "admin", email: "admin@example.com", name: "admin"))
		sign_in(@admin)
	end

	it "destroys the user and redirects to the home page" do
		user = User.create!(user_attributes)

    visit user_path(user)

    click_link 'Delete Account'

    expect(current_path).to eq(root_path)
    expect(page).to have_text('Account successfully deleted!')

    visit users_path

    expect(page).not_to have_text(user.name)
  end

  it "automatically signs out that user" do

		visit user_path(@admin)

		click_link 'Delete Account'

		expect(page).to have_link('Sign In')
		expect(page).not_to have_link('Sign Out')
	end
end
