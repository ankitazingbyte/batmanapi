module Api::V1
  class ApiController < ApplicationController
  	respond_to :json
  	include DeviseTokenAuth::Concerns::SetUserByToken
  end
end