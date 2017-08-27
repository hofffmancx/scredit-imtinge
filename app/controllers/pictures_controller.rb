class PicturesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :upload

  def upload
    @imgFile = params[:imgFile] # 取文件
    if @imgFile.nil?
      show_error('No File Selected!') && return
    else
      begin
        uploader = PictureUploader.new
        uploader.store!(@imgFile)
        file_url = uploader.url
        # file_url = 'http://localhost:3000' + file_url

        render plain: file_url
      rescue CarrierWave::UploadError => e
        show_error(e.message) && (return)
      rescue Exception => e
        show_error(e.to_s) && (return)
      end
    end
  end

  private

  def show_error(msg)
    render plain: "error|#{msg}" # 失败后返回'error|XXXXX'格式的内容
  end
end
