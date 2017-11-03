class RestaurantsController < ApplicationController

  before "/restaurants/*" do
    if !request.post?
      if !logged_in
        @alert_msg[:danger_alert] = "Please login to choose new restaurants."
        erb :'users/login'
      end
    end
  end

  # INDEX: restaurants view all.
  get '/restaurants' do
    @restaurants = Restaurant.order('updated_at ASC').limit(10)
    # @restaurants = Restaurant.all.order('updated_at DESC').paginate(page: params[:page], per_page: 5)
    erb :'restaurants/index'
  end

  # NEW: restaurants new
  get '/restaurants/new' do

    if !logged_in
      @alert_msg[:danger_alert] = "Please login to choose new Restaurant."
      erb :'users/login'
    else
      @restaurant = Restaurant.new  ## Prevents errors on Form Partial.
      erb :'restaurants/new'
    end

  end

  #### CREATE NEW RESTAURANT (ASSOCIATED W/ USER ID) ####
  post '/restaurants' do
    params[:restaurant][:user_id] = @user.id
    @restaurant = Restaurant.find_or_create_by(params[:restaurant])

    if @restaurant.valid?
      @alert_msg[:success_alert] = "Congratulations, #{@user.username.capitalize}.  #{@restaurant.name.capitalize} profile has been created."
      erb :'restaurants/user_restaurants'
    else
      @alert_msg[:danger_alert] = "Sorry, #{@user.username.capitalize}.  Invalid Entry.  Please try again."
      erb :'/restaurants/new'
    end

  end

  #### USER CAN VIEW LIST OF RESTAURANTS THEY POSTED (ASSOCIATED W/ USER ID) ####
  get '/restaurants/user_restaurants' do
    if !logged_in
      @alert_msg[:danger_alert] = "Please login to view your restaurants."
      erb :'users/login'
    else
      @user_restaurants = Restaurant.where(user_id: @user.id)
      erb :'restaurants/user_restaurants'
    end
  end

  #### USERS CAN SUBMIT REVIEW OF RESTAURANT (ASSOCIATED W/ AUTHOR USER ID & RESTAURANT ID) ####
  # get '/restaurants/:id/restaurant_review_form' do
  #   if !logged_in
  #     @alert_msg[:danger_alert] = "Please login to submit a review."
  #     erb :'users/login'
  #   else
  #     @restaurant = Restaurant.find(params[:id])
  #     erb :'restaurants/restaurant_review_form'
  #   end
  # end


  # post '/restaurants/:id/restaurant_review_form' do
  #   Review.find_or_create_by(rating: params[:review][:rating], description: params[:review][:description], user_id: @user.id, restaurant_id: params[:id])
  #   @alert_msg[:success_alert] = "Your review has been submitted."
  #
  #   redirect '/restaurants'
  # end

  ###############

  post '/restaurants/:id/restaurant_review_form' do
    if !logged_in
      @alert_msg[:danger_alert] = "Please login to post reviews."
      erb :'users/login'
    else
      review = Review.find_or_create_by(rating: params[:review][:rating], description: params[:review][:description], user_id: @user.id, restaurant_id: params[:id])
      # binding.pry
      @restaurant = Restaurant.find(params[:id])

      if review.valid?
        @alert_msg[:success_alert] = "Thanks, #{@user.username.capitalize}!  We appreciate your review for #{@restaurant.name.capitalize}."
        erb :'restaurants/user_restaurants'
      else
        @alert_msg[:danger_alert] = "Sorry, #{@user.username.capitalize}.  Invalid Entry.  Please try again."
        erb :'restaurants/show'
      end
    end

  end

  #############


  # SHOW: displays a single restaurant detail page.
  get '/restaurants/:id' do
    @restaurant = Restaurant.find(params[:id])
    erb :'restaurants/show'
  end

  # EDIT:
  get '/restaurants/:id/edit' do
    @restaurant = Restaurant.find(params[:id])
    erb :'restaurants/edit'
  end

  ##### Update Method (patch or put) ####

  # UPDATE: Method for patch and put
  def update_restaurant
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(params[:restaurant])
    redirect "/restaurants/#{@restaurant.id}"
  end

  # UPDATE: patch
  patch '/restaurants/:id' do
    update_restaurant
  end

  # UPDATE: put
  put '/restaurants/:id' do
    update_restaurant
  end

  #################################

  # DELETE:
  delete '/restaurants/:id' do
    Restaurant.find(params[:id]).destroy!
    redirect '/restaurants/user_restaurants'
  end

end
