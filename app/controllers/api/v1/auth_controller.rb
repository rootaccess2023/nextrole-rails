module Api
  module V1
    class AuthController < ApplicationController

      # POST /api/v1/signup
      def signup
        @user = User.new(user_params)
        if @user.save
          token = JsonWebToken.encode(user_id: @user.id)
          render json: { token: token, user: user_json(@user) }, status: :created
        else
          render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # POST /api/v1/login
      def login
        @user = User.find_by(email: params.dig(:user, :email)&.downcase)
        if @user&.authenticate(params.dig(:user, :password))
          token = JsonWebToken.encode(user_id: @user.id)
          render json: { token: token, user: user_json(@user) }, status: :ok
        else
          render json: { error: "Invalid email or password" }, status: :unauthorized
        end
      end

      # DELETE /api/v1/logout
      # JWT is stateless — nothing to invalidate server-side.
      # Client deletes the token from device storage.
      def logout
        render json: { message: "Logged out successfully" }, status: :ok
      end

      private

      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :target_role, :target_location, :employment_type, :follow_up_days, :phone, :linkedin_url, :portfolio_url)
      end

      def user_json(user)
        { id: user.id, email: user.email }
      end
    end
  end
end