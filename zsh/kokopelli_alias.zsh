# alias
alias kalias="nvim ~/kalias"

# sail
alias ksail="bash sail"

# aws
alias awslogin="saml2aws login -a koko --session-duration 43200 --force"

# projects
alias ba="cd ~/Projects/ba"
alias badev="cd ~/Projects/ba/badev"
alias bigadvance="cd ~/Projects/ba/bigadvance"

#postgres
alias pqlogin="dc exec db psql -U webapp -d"

# tests
alias batest="~/Projects/ba/bigadvance/src/xba/phpunit/run.sh --testdox"
alias batest-up="~/Projects/ba/bigadvance/src/xba/phpunit/up.sh"
alias batest-down="~/Projects/ba/bigadvance/src/xba/phpunit/down.sh"
alias batest-coverage="~/Projects/ba/bigadvance/src/xba/phpunit/run.sh --testdox --coverage-html coverage-result"
alias batest-cd="cd ~/Projects/ba/bigadvance/src/xba/phpunit"
alias apitest="docker compose exec phpunit vendor/bin/phpunit --testdox"
alias apitest-coverage="docker compose exec phpunit vendor/bin/phpunit --testdox --coverage-html coverage-result"

#migration
migration-xba() {
  cd ~/Projects/ba/bigadvance/src/xba
  docker/migration.sh "$1"
}

migration-bam() {
  cd ~/Projects/ba/bigadvance/src/bamanager
  docker/migration.sh  bamanager
}

# batch
batch-xba() {
  cd ~/Projects/ba/badev
  docker compose run --rm -u webapp -e "XBA_SYSTEM_CODE=$1" xba ./mk refine "$2"
}

batch-bam() {
  cd ~/Projects/ba/badev
  docker compose run --rm -u webapp bamanager ./mk refine "$1"
}

badev-up() {
  cd ~/Projects/ba/badev
  docker compose up -d bamanager bamanager-bg big-advance-api ba-admin-frontend ba-admin-backend ba-idp xba-front ba-site-frontend chat-api chat-api-bg ba-chat minio
}

badev-down() {
  cd ~/Projects/ba/badev
  docker compose down
}