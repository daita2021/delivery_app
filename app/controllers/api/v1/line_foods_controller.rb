module Api
  module V1
    class LineFoodsController < ApplicationController
      before_action :set_food, only: %i[create] #createアクション実行前にset_food実行

      def create
      # もし他店舗のアクティブな仮注文が存在したら下のjsonデータを返す
        if LineFood.active.other_restaurant(@ordered_food.restaurant.id).exists?
          return render json: {
            existing_restaurant: LineFood.other_restaurant(@ordered_food.restaurant.id).first.restaurant.name,#すでに作成されている店舗情報
            new_restaurant: Food.find(params[:food_id]).restaurant.name,#このリクエストで作成しようとした新店舗の情報
          }, status: :not_acceptable
        end

        set_line_food(@ordered_food)

        if @line_food.save
          render json: {
            line_food: @line_food
          },status: :created
        else
          render json: {}, status: :internal_server_error
        end
      end

      private

      def set_food
        @ordered_food = Food.find(params[:food_id]) #createアクションからも参照できるように、グローバルで使えるインスタンス変数にパラメーターで受け取ったidのfoodデータを代入
      end

      #他店舗の仮注文が無い通常の仮注文処理
      def set_line_food(ordered_food)
        #すでに同じfoodに関するline_foodが存在する場合
        if ordered_food.line_food.present?
          @line_food = ordered_food.line_food
          @line_food.attributes = {
            count: ordered_food.line_food.count + params[:count],
            active: true
          }
        else
          @line_food = ordered_food.build_line_food(
            count: params[:count],
            restaurant: ordered_food.restaurant,
            active: true
          )
        end
      end

    end
  end
end
