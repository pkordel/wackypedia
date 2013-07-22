# Rake::Task['default'].clear
task('default').clear
task 'default' => %w[test:unit test:integration]
# task 'default' => %w[test:unit test:integration test:acceptance]
