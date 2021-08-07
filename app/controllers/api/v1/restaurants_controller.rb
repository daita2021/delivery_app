module Api
  module V1
    class RestaurantsController < ApplicationController

      def index
        restaurants = Restaurant.all

        #render json: {}でjson形式データを返却
        render json: {
          restaurants: restaurants
        },status: :ok
        end
    end
  end
end
