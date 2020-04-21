class TimesController < ApplicationController
    def current
        @date = Time.now.strftime("%b %d, %Y")
        @time = Time.now.strftime("%H:%M %p")
    end
end
