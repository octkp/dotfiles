# alias
alias kalias="nvim ~/kalias"

# sail
alias ksail="bash sail"

# aws
alias awslogin="aws sso login --profile ba_developers"
alias jump-login-test="ssh -l ec2-user i-066b16d5ec5ec8f8c"

# dev
alias ba="cd ~/dev/ba"
alias badev="cd ~/dev/ba/badev"
alias bigadvance="cd ~/dev/ba/bigadvance"

#postgres
alias pqlogin="dc exec db psql -U webapp -d"

# tests
alias batest="~/dev/ba/bigadvance/src/xba/phpunit/run.sh --testdox"
alias batest-up="~/dev/ba/bigadvance/src/xba/phpunit/up.sh"
alias batest-down="~/dev/ba/bigadvance/src/xba/phpunit/down.sh"
alias batest-coverage="~/dev/ba/bigadvance/src/xba/phpunit/run.sh --testdox --coverage-html coverage-result"
alias batest-cd="cd ~/dev/ba/bigadvance/src/xba/phpunit"
alias apitest="docker compose exec phpunit vendor/bin/phpunit --testdox"
alias apitest-coverage="docker compose exec phpunit vendor/bin/phpunit --testdox --coverage-html coverage-result"

#migration
migration-xba() {
  cd ~/dev/ba/bigadvance/src/xba
  docker/migration.sh "$1"
}

migration-bam() {
  cd ~/dev/ba/bigadvance/src/bamanager
  docker/migration.sh  bamanager
}

# batch
batch-xba() {
  cd ~/dev/ba/badev
  docker compose run --rm -u webapp -e "XBA_SYSTEM_CODE=$1" xba ./mk refine "$2"
}

batch-bam() {
  cd ~/dev/ba/badev
  docker compose run --rm -u webapp bamanager ./mk refine "$1"
}

badev-up() {
  cd ~/dev/ba/badev
  docker compose up -d bamanager bamanager-bg big-advance-api ba-admin-frontend ba-admin-backend ba-idp xba-front ba-site-frontend chat-api chat-api-bg ba-chat minio
}

badev-down() {
  cd ~/dev/ba/badev
  docker compose down
}

badev-restart() {
  cd ~/dev/ba/badev
  docker compose restart bamanager bamanager-bg big-advance-api ba-admin-frontend ba-admin-backend ba-idp xba-front ba-site-frontend chat-api chat-api-bg ba-chat minio
}