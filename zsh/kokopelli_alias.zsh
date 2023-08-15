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
alias batest-cd="cd ~/Projects/ba/bigadvance/src/xba/phpunit"
alias apitest="docker compose exec phpunit vendor/bin/phpunit --testdox"

# batch
batch-xba() {
  cd ~/Projects/ba/badev
  docker compose run --rm -u webapp -e "XBA_SYSTEM_CODE=$1" xba ./mk refine "$2"
}

batch-bam() {
  cd ~/Projects/ba/badev
  docker compose run --rm -u webapp bamanager ./mk refine "$1"
}