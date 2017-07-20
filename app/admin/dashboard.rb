ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

    columns do
      column do
        panel 'Recent Firmware Builds' do
          table_for FirmwareBuild.order(release_date: :desc).limit(10).each do |build|
            column  :release_date
            column  :hardware_revision
            column('Software Revision') { |build| link_to build.software_revision, admin_firmware_build_path(build) }
          end
        end

        panel 'Rolling 7-day New Account Activity' do

        end

        panel 'Accounts per US State' do
          geo_chart APIRequest.where(new: true).select(:region).count, region: 'US'
        end
      end
    end
  end # content
end
