require 'crud_helper'
class ApplicationController < ActionController::Base
protect_from_forgery
respond_to :html, :xml, :json
before_action :set_obj, only: [:show, :edit, :update, :destroy]
include ApplicationHelper
include CrudHelper
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

    def record_not_found
      #render :file => '/public/404.html',status: 404
      render text:tts('error .'),layout:true,status: 404
    end    
end