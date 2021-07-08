class VideoController < ApplicationController
  def index
    @video = redirect_to 'https://eu3.camflg.com:5443/LiveApp/streams/384963471053269811399539.m3u8?token=undefined'
  end
end
