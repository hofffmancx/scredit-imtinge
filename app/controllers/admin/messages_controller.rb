class Admin::MessagesController < ApplicationController
  layout "admin"
  def index
    @messages = Message.all
  end

  def is_read
    @message = Message.find(params[:id])
    @message.read!
    redirect_to :back
  end
end
