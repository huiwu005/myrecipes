class ChatroomsController < ApplicationController
    def show
        @message = Message.new
        @messages = Message.most_rencent
    end
end
