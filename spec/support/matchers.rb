RSpec::Matchers.define :have_form_errors do
  match do |actual|
    actual.all('.inline-errors').any?
  end
end

RSpec::Matchers.define :have_flash do |expected|
  match do |actual|
    actual.all(".flash.#{expected.to_s}").any?
  end
end
