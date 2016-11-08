namespace :util do
  desc 'Show deployed git-revision'
  task :revision do
    on roles(:all) do
      output = capture("tail #{current_path.join('../revisions.log')}")
      puts output
    end
  end
end
