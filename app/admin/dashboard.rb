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
          table_for APIRequest.recent_7_days.each do |build|
            column  :remote_address
            column('Location') { |build| build.city + ', ' + build.region }
            column  :platform_type
            column  :os_version
            column('New') { |build| status_tag(build.new) }
          end
        end
      end
    end
  end # content
end
