class VideoController < ApplicationController
  def index
    @video = redirect_to 'https://eu3.camflg.com:5443/LiveApp/streams/015290301572984587686747.m3u8?token=undefined'
  end
end
