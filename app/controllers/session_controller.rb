class SessionController < ApplicationController
	 skip_before_action :authenticate_request, only: %i[login register]
  # POST /register
  def register
    @user = LoginDetail.create(user_params)
   if @user.save
    response = { message: 'User created successfully'}
    render json: response, status: :created 
   else
    render json: @user.errors, status: :bad
   end 
  end

  def login
    authenticate params[:email], params[:password]
  end
  
  def test
    byebug
    render json: {
          message: 'You have passed authentication and authorization test'
        }
  end
 
  def logout
        token = request.headers["Authorization"].split(' ').last
        UserAuthLog.find_by(auth_token: token).update(auth_token: "")
        render json: {status: :success, message: "Logout successfully"}
  end
  private

  def user_params
    params.permit(:email, :password, :login_role, :tenant_id)
  end

   def authenticate(email, password)
    command = AuthenticateUser.call(email, password)
    if command.success?
      #byebug
      user_id = JsonWebToken.decode(command.result)["user_id"]
      #UserAuthLog.create(auth_token: command.result, user_id: user_id)
      byebug
      render json: {
        access_token: command.result,
        message: 'Login Successful'
      }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
   end

end
