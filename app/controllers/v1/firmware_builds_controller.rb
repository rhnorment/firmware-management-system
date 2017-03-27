module V1

  class FirmwareBuildsController < ApplicationController
    def index
      firmware_builds = FirmwareBuild.all_cached
      json_response(firmware_builds)
    end

    def latest
      firmware_build = FirmwareBuild.latest
      json_response(firmware_build)
    end

    def show
      firmware_build = FirmwareBuild.find(params[:id])
      json_response(firmware_build)
    end
  end

end



