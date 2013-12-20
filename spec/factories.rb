FactoryGirl.define do
	factory :user do
		sequence(:name)  {|n| "Person #{n}"}
		sequence(:email) {|n| "Person_#{n}@person.com"}
	password "nabbits"
	password_confirmation "nabbits"
		factory :admin do
		admin true	
		end
	end
end