require 'spec_helper'
require 'capybara/rails'
       require 'capybara/rspec'
       include Capybara::DSL

describe "Static pages" do

	describe "Home page" do

		it "should have the h1 'sample app' " do
			visit '/static_pages/home'
			page.should have_selector('h1', :text => 'Sample App')
		end

		it "should have the correct title " do
			visit '/static_pages/home'
			page.should have_selector('title', 
				:text => 'Ruby on Rails Tutorial Sample App | Home')
		end
	end

	describe "Help page" do

		it "should have the h1 'help' " do
			visit '/static_pages/help'
			page.should have_selector('h1', :text => 'Help')
		end

		it "should have the correct title " do
			visit '/static_pages/help'
			page.should have_selector('title', 
				:text => 'Ruby on Rails Tutorial Sample App | Help')
		end

	end

	describe "About page" do

		it "should have the h1 'about' " do
			visit '/static_pages/about'
			page.should have_selector('h1', :text => 'About Us')
		end

		it "should have the correct title " do
			visit '/static_pages/about'
			page.should have_selector('title', 
				:text => 'Ruby on Rails Tutorial Sample App | About Us')
		end

	end

		describe "Contact Page" do

		it "should have the h1 'Contact' " do
			visit '/static_pages/contact'
			page.should have_selector('h1', :text => 'Contact')
		end

		it "should have the correct title " do
			visit '/static_pages/contact'
			page.should have_selector('title', 
				:text => 'Ruby on Rails Tutorial Sample App | Contact')
		end

	end

end

