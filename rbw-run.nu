#!/usr/bin/env nu

def main [...args] {
  if not ($args | any {|elt| $elt =~ '\w+:\w+:?\w+'}) and not ($args | any {|elt| $elt =~ '--'}) { 
    $"usage: rbw-run.nu <seed>:[field]:[varname] -- <command to run>
  
    Description: run `rbw get` in parallel to set environment variables to pass
    and execute another program.
  
    The [:::] argument can be repeated to fetch secrets with `rbw get` in
    parallel for as many entries as required to pass to <command>.
  
    The terms `seed` and `field` are as defined by the `rbw` rust bitwarden
    client.
  
    A seed is required. If the default entry returned by `rbw get` is what is
    desired you must specify the environment variable name to set for the
    command by specifying "varname" and leaving "field" empty.
    Ex: api.prod::API_SECRET
  
    If `field` is given, its name will be used as the variable name passed,
    unless `varname` is set, which will override the `field` name.
    Ex: api.prod:test_account:API_SECRET
    "
  } else {
      # https://github.com/aaronriekenberg/rust-parallel/blob/14ea4a8ebd954c603a3435a0abe6fc4ebe88bcc2/src/parser/regex.rs#L179
      let args = $args | split column : seed field var
      print $args
  }
}

# try {
#   rbw unlocked # out+err> null-device
# } catch {
#   # (rbw unlock) out+err> null-device
#   do (rbw unlock)
# }  

# let vaultLocked = rbw unlocked | $env.LAST_EXIT_CODE
# if $vaultLocked { print "locked" }
# print $vaultLocked
