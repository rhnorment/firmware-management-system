module V1

  class FirmwareBuildsController < ApplicationController

    def index
      firmware_builds = FirmwareBuild.all
      json_response(firmware_builds)
    end

    def latest
      firmware_build = FirmwareBuild.latest_cached
      json_response(firmware_build)
    end

    def show
      firmware_build = FirmwareBuild.find(params[:id])
      json_response(firmware_build)
    end

    def download_image
      firmware_build = FirmwareBuild.latest

      case params[:image]
      when 'image_a'
        filename = firmware_build.image_a.url.split('/').last
        send_file "#{Rails.root}/public/uploads/firmware_build/image_a/#{firmware_build.id}/#{filename}"
        json_response(200)
      when 'image_b'
        filename = firmware_build.image_b.url.split('/').last
        send_file "#{Rails.root}/public/uploads/firmware_build/image_b/#{firmware_build.id}/#{filename}"
        json_response(200)
      else
        json_response(404)
      end
    end
  end

end



