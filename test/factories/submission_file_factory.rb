# frozen_string_literal: true

FactoryBot.define do
  factory :submission_file do
    association :artist_submission

    created_at_on_site { Time.current }
    direct_url { "https://localhost/image.webp" }
    file_identifier { "" }
    content_type { "image/png" }
    width { 1_000 }
    height { 1_000 }
    size { 100.kilobytes }
    skip_original_validation { true }

    factory :submission_file_with_original do
      skip_original_validation { false }
      transient do
        file_name { nil }
        with_sample { false }
      end

      before(:create) do |submission_file, evaluator|
        submission_file.attach_original_from_file!(file_fixture(evaluator.file_name).open)
        submission_file.sample.attach(io: file_fixture(evaluator.file_name).open, filename: "sample") if evaluator.with_sample
      end
    end
  end
end