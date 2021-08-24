module Api
  module V1
    class UsersController < ApiController
      before_action :set_user, only: %i[balance payment feed]

      # GET /user/{id}/balance
      def balance
        @balance = @user.payment_account_balance

        render json: { balance: @balance }
      end

      # POST /user/{id}/payment
      def payment
        PaymentService.new(@user, params).pay_to_friend

        head :ok
      end

      # GET /user/{id}/feed
      def feed
        @feed = FeedService.new(@user, page_number).feed_activities
        @payments = PaymentDecorator.decorate_collection(@feed)
                                    .map(&:message)

        render json: { payments: @payments, page: page_number }
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def user_params
        params.require(:user).permit(:username)
      end

      def page_number
        page = params[:page]
        if page.present? && page.positive?
          page
        else
          1
        end
      end
    end
  end
end
