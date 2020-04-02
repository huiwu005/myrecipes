class MessagesController < ApplicationController
    before_action :require_user

    def create
        @message = Message.new(message_params)
        @message.chef = current_chef
        if @message.save
            # In app/controllers/comments_controller.rb
            # ActionCable.server.broadcast "comments", render(partial: 'comments/comment', object: @comment)

            ActionCable.server.broadcast 'chatroom_channel', message: render_message(@message),
                chef: @message.chef.chefname
            # redirect_to chat_path
        else
            render 'chatrooms/show'
        end
    end
    private
    def message_params
        params.require(:message).permit(:content)
    end
    def render_message(message)
        # app/views/messages/_message.html.erb
        render(partial: 'message', locals: { message: message })
    end
end