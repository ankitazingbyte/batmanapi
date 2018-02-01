module Api::V1 
  class RegistrationsController < ApiController    
     include UserSignatures
     before_action :verify_token!, except:[:create] 
    def new
      user = User.new
    end
    def create
      user = User.create(create_params)
      user.skip_confirmation!
    	if !user.errors.present? && user.save
    		render json: {message: "User Successfully Signup", auth_token: user.auth_token}, status: :ok
      else
      	render json: {message: "Sorry User not Signup" ,reason: user.errors.full_messages.to_sentence}
      end
    end

    def update
      @current_user.update_attributes(update_params)
      render json: {message: "User Successfully Update", user: @current_user}
    end

    def destroy
      @current_user.destroy()
      render json: {message: "User Successfully Deleted"} 
    end
    private
    def create_params
      params.require(:user).permit(:name, :first_name, :last_name, :gender, :auth_token, :email, :image, :nickname)
    end
  end
end
