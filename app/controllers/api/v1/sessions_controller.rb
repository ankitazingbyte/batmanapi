module Api::V1 
  class RegistrationsController < ApiController  
    # include UserSignatures
    before_action :verify_token!

  	def create
  		user_token = request.headers['HTTP_AUTH_TOKEN']
  		if User.find_by_auth_token(user_token).present?
  			@user =  User.find_for_database_authentication(email: params[:user][:email])
        if @user.valid_password?(params[:user][:password])
          debugger
  				sign_in("user", @user)
          debugger
  				render json: {message: "Sign in Success" , user: @user}
  			else
  				render json: {message: "Password not matched"}
  			end	
  		else
  			render json: {message: "Token Invalid"}
  		end	
  	end	

    def destroy
      debugger
      if current_user.present?
        sign_out(current_user)
        render json: {status: "successful", message: "Your Account Logged Out Successfully" }
      else
        render json: {status: "failed", message: "Authentication token is not valid" }
      end
    end  

  end  
end