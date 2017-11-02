# set -x PATH /usr/local/Cellar/llvm/5.0.0/bin $PATH
# set -U CC /usr/local/Cellar/llvm/5.0.0/bin/clang
# set -U CXX $CC"++"
set -gx GOROOT /usr/local/Cellar/go/1.9.1/libexec
# set -g PATH $GOROOT/bin $PATH
set -gx GOPATH ~/Documents/dev/gocode

set -x llvm_path /usr/local/opt/llvm/bin

set -gx fish_user_paths  $llvm_path $GOROOT/bin $GOPATH/bin $fish_user_paths
