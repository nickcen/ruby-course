class ApplicationController < ActionController::API
  before_action :authenticate!

  protected

  def authenticate!
    token = Token.decode(params[:token])

    render_failed and return unless token

    print "token is #{token}"
  rescue JWT::VerificationError, JWT::DecodeError
    render_failed
  end

  private

  def render_failed(messages = ['验证失败'])
    render json: { errors: messages}, status: :unauthorized
  end
end
