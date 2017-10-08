class SessionsController < ApplicationController
  skip_before_action :authenticate!

  def index
    ret = {token: Token.encode(user_id: 1)}

    render json: ret
  end
end
