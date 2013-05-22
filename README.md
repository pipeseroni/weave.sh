weave.sh
========

*Weaving with simple math in terminal.*

It's written intently to be used as a screensaver. To weave, you need to give it an evaluation code as first argument, e.g.

```bash
weave.sh '(((x + y) % 2))'
```

The script draws vertical lines first, then use the supplied code to decide if a horizontal line is weaved over the vertical line. Where `x` is between 1 and terminal width `W` (columns)  and `y` is between 1 and terminal height `H` (rows). If it evaluates as true, meaning the final value == 0, then it does that; otherwise go under the vertical line. There is more examples in `sample-screensaver.sh`. You can even write a Bash function if it's too complicated as one-liner:

```bash
triangle() {
  (((x + y) % 2)) && ((x * H / W >= (y - 1)))
}
export -f triangle

weave.sh 'triangle'
```

Configuration
-------------

The script has no options, it relies on environment variables entirely, the following is the default values:

```bash
# Characters and colors for vertical and horizontal lines
char_v='|'            char_h='-'
color_v='\e[32;1m'    color_h='\e[31;1m'

# Sleep delays
sleep_v=0.01          ${sleep_h=0.01
sleep_end=5

eval_h="$1"           # Get evaluation code from '$1'
eval_h='(((x+y)%2))'  # , or set to a default pattern
show_eval_h=no        #"yes" to print out evaluation code
```

For example, if you want to change the characters, you can do

```bash
char_v='┃' char_h='━' weave.sh
```

Screenshots and video
---------------------

[![weave.sh '(( $(echo "v=s(($x-1)*2*4*a(1)/$W);scale=0;$H-$H*(v+1)/2 == $y" | bc -l) ))'](http://farm3.staticflickr.com/2811/8778875471_49a29dcbe4_z.jpg)](http://www.flickr.com/photos/livibetter/8778875471/)

[![weave.sh '(((x % 5 + y % 11) % 2))](http://farm4.staticflickr.com/3810/8785449798_9dd3395990_z.jpg)](http://www.flickr.com/photos/livibetter/8785449798/)

Here is a [aideo of `sample-screensaver.sh`](http://youtu.be/voFiTMweXHs).

Contribution
------------

Feel free to create pull request. Whether make the code better or add some awesome examples to `sample-screensaver.sh`, they are all welcome.

License
-------

    Copyright (c) 2013 Yu-Jie Lin
    weave.sh is licensed under the MIT License
