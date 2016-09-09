function check_merge_test()
{
  base_branch=$1
  target_branch=$(git branch --color=never --contains | cut -d ' ' -f2)
  test_target=$(mktemp -t 'test_target')
  echo "Test target"
  echo "=================================="
  # show differences
  # echo "git diff --name-only ${base_branch}..${target_branch} | grep '_spec.rb' | xargs -n1 echo"
  git diff --name-only ${base_branch}..HEAD | grep --colour=never '_spec.rb' | tee -a $test_target
  # ruby以外
  git diff --name-only ${base_branch}..HEAD | grep -v '^spec/' | grep --colour=never 'app' | egrep -v '(app\/assets|config/)' | sed -e 's/app\//spec\//' | grep -v '\.rb$' | xargs -n1 -I% echo "%_spec.rb" | tee -a $test_target
  # ruby
  git diff --name-only ${base_branch}..HEAD | grep -v '^spec/' | grep --colour=never 'app' | sed -e 's/app\//spec\//' | grep --colour=never '\.rb$' | sed -e 's/\.rb/_spec\.rb/' | tee -a $test_target
  echo "=================================="
  # execute spec
  echo ""
  echo "Not found test case..."
  echo "=================================="
  find $(cat $test_target) -and -type f -print 1>/dev/null
  echo "=================================="
  find $(cat $test_target) -and -type f -print 2>/dev/null | xargs echo > $test_target
  echo ""
  echo "bundle exec rspec $(cat $test_target)"
  bundle exec rspec $(cat $test_target)
  rm -v $test_target
}
