    # app/commands/authorize_api_request.rb 

class AuthorizeApiRequest
  prepend SimpleCommand

  def initialize(headers = {})
    @headers = headers
  end

  def call
    login_detail
  end

  private

  attr_reader :headers

  def user
    @user ||= LoginDetail.find(decoded_auth_token[:login_detail_id]) if decoded_auth_token
    @user || errors.add(:token, 'Invalid token') && nil
  end

  def decoded_auth_token
    #if UserAuthLog.exists?(auth_token: http_auth_header)
      @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
    #end
    #@decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  def http_auth_header
    if headers['Authorization'].present?
      return headers['Authorization'].split(' ').last
    else errors.add(:token, 'Missing token')
    end
    nil
  end
end
