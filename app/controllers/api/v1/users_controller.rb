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

      def feed
        # TODO
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
    end
  end
end
