def firmware_build_attributes(overrides={})
  {
      release_date: Faker::Date.forward(3),
      hardware_revision: 1.1,
      software_revision: 2.2,
      image_a: File.new("#{Rails.root}/spec/support/fixtures/profile1.bin"),
      image_b: File.new("#{Rails.root}/spec/support/fixtures/profile2.bin")
  }.merge(overrides)
end