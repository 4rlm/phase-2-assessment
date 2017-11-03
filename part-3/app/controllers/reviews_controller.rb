class ReviewsController < ApplicationController

  # before "/reviews/*" do
  #   if !request.post?
  #     if !logged_in
  #       @alert_msg[:danger_alert] = "Please login to choose new reviews."
  #       erb :'users/login'
  #     end
  #   end
  # end

  # INDEX: reviews view all.
  get '/reviews' do
    @reviews = Review.order('updated_at ASC').limit(10)
    # @reviews = Review.all.order('updated_at DESC').paginate(page: params[:page], per_page: 5)
    erb :'reviews/index'
  end

  # NEW: reviews new
  get '/reviews/new' do

    if !logged_in
      @alert_msg[:danger_alert] = "Please login to choose new Review."
      erb :'users/login'
    else
      @review = Review.new  ## Prevents errors on Form Partial.
      erb :'reviews/new'
    end

  end


  # CREATE:
  post '/reviews' do
    @review = Review.create(params[:review])
    redirect '/reviews'
  end

  # SHOW: displays a single review detail page.
  get '/reviews/:id' do
    @review = Review.find(params[:id])
    erb :'reviews/show'
  end

  # EDIT:
  get '/reviews/:id/edit' do
    @review = Review.find(params[:id])
    erb :'reviews/edit'
  end

  ##### Update Method (patch or put) ####

  # UPDATE: Method for patch and put
  def update_review
    @review = Review.find(params[:id])
    @review.update(params[:review])
    redirect "/reviews/#{@review.id}"
  end

  # UPDATE: patch
  patch '/reviews/:id' do
    update_review
  end

  # UPDATE: put
  put '/reviews/:id' do
    update_review
  end

  #################################

  # DELETE:
  delete '/reviews/:id' do
    Review.find(params[:id]).destroy!
    redirect '/reviews'
  end

end

