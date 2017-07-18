module V1

  class FirmwareBuildsController < ApplicationController

    def index
      firmware_builds = FirmwareBuild.all
      json_response(firmware_builds)
    end

    def latest
      firmware_build = FirmwareBuild.latest_cached
      json_response(firmware_build)

      APIRequest.record_api_request(request)
    end

    def show
      firmware_build = FirmwareBuild.find(params[:id])
      json_response(firmware_build)
    end
  end
end



