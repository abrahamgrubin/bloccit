 require 'rails_helper'
 
 FactoryGirl.define do
  
 describe VotesController do 
 
  

   include Devise::TestHelpers
 
   describe '#up_vote' do
     it "adds an up-vote to the post" do
      request.env["HTTP_REFERER"] = '/'
       @user = authenticated_user
       @post = post_without_user
       sign_in @user
 
       expect {
         post( :up_vote, post_id: @post.id )
       }.to change{ @post.up_votes }.by 1
     end
   end

   describe '#down_vote' do 
    it "adds a down-vote to the post" do 
      request.env["HTTP_REFERER"] = '/'
      @user = authenticated_user
      @post = post_without_user
      sign_in @user

      expect {
        post( :down_vote, post_id: @post.id )
      }.to change{ @post.down_votes }.by -1
    end
 end