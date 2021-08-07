module Api
  module V1
    class FoodsController < ApplicationController
      def index
        restaurant = Restaurant.find(params[:restaurant_id]) #params[:restaurant_id]はリクエストに含まれている店舗IDを受け取る
        foods = restaurant.foods

        render json: {
          foods: foods
        }, status: :ok
      end
    end
  end
end
