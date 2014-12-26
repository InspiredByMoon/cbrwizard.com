interactor :simple

guard :bundler do
  # On gemfile update run bundle
  watch('Gemfile')
end

guard :rubocop, all_on_start: false, keep_failed: false do
  watch(%r{^(.+)\.rb$}) { |m| "#{m[1]}.rb" }
end

guard :rspec, cmd: 'rspec' do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }

  # run the model specs related to the changed model
  watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }

  # Controller changes
  watch(%r{^app/controllers/(.+)_controller\.rb$})  { |m| "spec/controllers/#{m[1]}_controller_spec.rb" }

  watch('config/routes.rb')                           { "spec/controllers" }
  watch('app/controllers/application_controller.rb')  { "spec/controllers" }

  watch(%r{^spec/support/(.+)\.rb$})                  { "spec" }
  watch('spec/rails_helper.rb')                       { "spec" }
  watch('spec/spec_helper.rb')                        { "spec" }

  # Capybara features specs
  watch(%r{^app/views/(.+)/(.*)\.(.*)\.(erb|haml|slim)$})     { |m| "spec/features/#{m[1]}/#{m[2]}_feature_spec.rb" }
  watch(%r{^app/views/(.+)/_.*\.(erb|haml|slim)$})     { |m| "spec/features/#{m[1].partition('/').first}/#{m[1].partition('/').last}_feature_spec.rb" }

  # On JSON schema runs all controllers for this version
  watch(%r{^spec/support/api/schemas/(.+)$})     { |m| "spec/controllers/api/#{m[1].partition('/').first}" }
end
