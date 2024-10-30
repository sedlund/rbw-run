Description: run `rbw get` in parallel to set environment variables to pass and
execute another program.

The [:::] argument can be repeated to fetch secrets with "rbwwget" in parallel
for as many entries as required to pass to <command>.

The terms "seed" and "field" are as defined by the "rbw" rust bitwarden client.

A seed is required. If the default entry returned by "rbw get" is what is
desired you must specify the environment variable name to set for the command by
specifying "varname" and leaving "field" empty. Ex: api.prod::API_SECRET

If "field" is given, its name will be used as the variable name passed, unless
"varname" is set, which will override the "field" name. Ex:
api.prod:test_account:API_SECRET