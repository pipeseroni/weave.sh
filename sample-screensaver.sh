#!/bin/bash
# Copyright (c) 2013 Yu-Jie Lin
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
# of the Software, and to permit persons to whom the Software is furnished to do
# so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.


PATH=.:$PATH
script=weave.sh
export char_v='┃' char_h='━'
export show_eval_h=yes

triangle() {
  (((x + y) % 2)) && ((x * H / W >= (y - 1)))
}
export -f triangle

while :; do
  export color_v="\e[3$((RANDOM%7+1));1m" color_h="\e[3$((RANDOM%7+1));1m"

  "$script"

  "$script" "(((x % $((RANDOM % 7 + 1)) + y % $((RANDOM % 13 + 2))) % $((RANDOM % 5 + 2))))"

  "$script" 'triangle'

  "$script" '((RANDOM % 2))'

  sleep_h=0 sleep_v=0 \
  "$script" '(( $(echo "v=s(($x-1)*2*4*a(1)/$W);scale=0;$H-$H*(v+1)/2 == $y" | bc -l) ))'
done
