web: bin/rails server -p $PORT -e $RAILS_ENV
css: bin/rails assets:precompile
release: bundle exec rails db:migrate 2>/dev/null || bundle exec rails db:setup