require 'crud_helper'
class ApplicationController < ActionController::Base
protect_from_forgery
respond_to :html, :xml, :json
before_action :set_obj, only: [:show, :edit, :update, :destroy]
include ApplicationHelper
include CrudHelper
end