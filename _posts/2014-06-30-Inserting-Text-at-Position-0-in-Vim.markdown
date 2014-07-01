---
layout: post_page
title:  "Inserting Text at Postion 0 in Vim"
date:   2014-06-30 17:10:00
categories: Journal Vim
---

I have never taken the time to learn how to insert text in the first position in a row or document in Vim. Since I am coding most of the time I don't run across a need for this often as text is usually indented and not bumping the left edge of the buffer.

Today happened to be one of the few days when I have to insert text at position 0. My normal appraoch to this is go to the first position in the row, go into insert mode, adding a space, going to the beginning of the row, inserting the text, going to the beginning of the row, then deleting the extra space. The keystrokes look something like this:

1. 0
2. i
3. \<space\>
4. 0
5. p
6. 0
7. x

This process is ridiculous.

###Solution
This can all be solved with "P". Learning this little command cut down six keystrokes. I saw this in Practical Vim a while back and glossed over it.
