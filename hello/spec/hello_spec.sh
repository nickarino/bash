#shellcheck shell=sh
docker_call()
{
echo '1'  
#docker run -it --rm  `#could use -u $(id -u):$(id -g)` \
#    -v "$PWD:/src" shellspec/shellspec -s /bin/bash 
}

# TODO look through his examples. 

# Describe 'hello.sh'
#   Include lib/hello.sh
#   It 'says hello'
#     When call hello ShellSpec
#     The output should equal 'Hello ShellSpec!'
#   End
# End

Describe 'learning shellspec'
  Include lib/hello.sh
  #contains(){[[ "$STR" == *"$SUB"* ]];}
  contains(){ [[ "gh: command not found" == *"not found"* ]]; }
  It 'cannot call gh without env'
    When run contains
    The status should be success
    # When call command gh
    # The stderr should 
    # The status should be failure
  End

  It 'can trap exit'
      abort() { exit 1; }
      When run abort # if use "call evaluation", shellspec is terminate
      The status should be failure
  End
End

# Describe 'pwd'
#   It 'calls pwd'
#     When call command pwd
#   End
# End


# Describe 'docker call'
#   Skip
#   It 'says run'
#     When run command docker run -it --rm -v "$PWD:/src" shellspec/shellspec -s /bin/bash --quick
#     %logger stout;
#   End
# End

# Describe 'docker call 2'
#   Skip
#   It 'says run2'
#     When call pwd
#     %logger stdout;
#   End
# End

# add() { echo "$1 + $2" | bc; }

# Describe 'blah'
#   Skip
#   It 'performs addition'          # example
#     When call add 2 3             # evaluation
#     The output should eq 5        # expectation
#     The status should be success  # another expectation
#   End
# End

# get_version() {
#   # The result of the evaluation is passed as arguments
#   # $1: stdout, $2: stderr, $3: status
#   echo pwd 
# }

# When call echo "GNU bash, version 4.4.20(1)-release (x86_64-pc-linux-gnu)"
# The result of function get_version should equal "4.4.20"
# The result of "get_version()" should equal "4.4.20" # shorthand
# check_version() {
#   # The result of the evaluation is passed as arguments
#   # $1: stdout, $2: stderr, $3: status
#   [ "$("$1" | grep -o '[0-9.]*' | head -1)" = "4.4.20" ]
# }

# When call echo "GNU bash, version 4.4.20(1)-release (x86_64-pc-linux-gnu)"
# The result of function check_version should be successful
# The result of "check_version()" should be successful # shorthand