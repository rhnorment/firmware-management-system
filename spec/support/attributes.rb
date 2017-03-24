def firmware_build_attributes(overrides={})
  {
      release_date: Faker::Date.forward(3),
      hardware_revision: 1.1,
      software_revision: 2.2,
      firmware_image: File.new("#{Rails.root}/spec/support/fixtures/profile1.jpg"),
  }.merge(overrides)
end