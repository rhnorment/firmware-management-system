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

        panel 'Rolling 7-day New Account Activity By Day' do
          column_chart APIRequest.seven_day_activations
        end

        panel 'Accounts per US State' do
          geo_chart APIRequest.accounts_by_state, library: { region: 'US',  resolution: 'provinces' }
        end
      end
    end
  end # content
end
