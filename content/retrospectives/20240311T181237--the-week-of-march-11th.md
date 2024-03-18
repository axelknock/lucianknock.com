+++
title      = "The Week of March 11th"
date       = 2024-03-11T18:12:37-04:00
identifier = "20240311T181237"
slug       = "the-week-of-march-11th"
summary    = "I built a bookshelf and read partway through a book on why I can only read partway through books. Wrote some elisp."
+++

## Goals
| #                                                    | Goal                                           | Grade |
|:-----------------------------------------------------|:-----------------------------------------------|:------|
| [1](#add-a-bookshelf-to-my-website)                  | Add a bookshelf to my website                  | A     |
| [2](#make-more-progress-on-getting-a-freelance-gig)  | Make more progress on getting a freelance gig  | D     |
| [2.1](#update-my-resume)                             | Update my resume                               | C     |
| [2.2](#set-up-on-every-likely-website-to-find-a-gig) | Set up on every likely website to find a gig   | ?     |
| [3](#finish-reading-scattered-minds-by-gabor-mate)    | Finish reading *Scattered Minds* by Gabor Mate | D     |

## Notes

### Add a bookshelf to my website

[Done](/bookshelf).

### Make more progress on getting a freelance gig

#### Update my resume

Somewhat done. Will be posting it to my website once it's complete so that I can have a central updated resource (and track who looks at it using Urchin Tracking Module parameters).

#### Set up on every likely website to find a gig

I looked through some of the alternatives to Upwork and found them lacking. I have also once more become de-motivated by the whole idea of freelancing.

Perseverance in this case is necessary though, and I must attain and complete at least one gig before I call it quits.
### Finish reading *Scattered Minds* by Gabor Mate
38% complete. That's honestly a lot more reading than I would have done if I had not set it as one of my weekly goals, but still, not even half-way through.

I have never been diagnosed, but believe I have it. I hope that the latter part of the book will include some beneficial coping mechanisms, like "how to make a goal of finishing a book and sticking to it", that sort of thing.

One of my traits is that I finish all of the books that I start reading (in earnest). If I get 10% through a book and only realize then that it is not worth the e-ink that it is printed on, I keep on reading anyway. I think this is one of the ways I have naturally coped with the strong inertial urge to leave things incomplete. Unfortunately it makes it harder to begin reading new books. 

## Sidenotes

### Emacs Indirect Buffer DWIM and Join Function

I also wrote what I think is a very useful emacs function, with some [inspiration](https://demonastery.org/2013/04/emacs-narrow-to-region-indirect/#a-handy-shortcut):

```emacs-lisp
(defun narrow-to-region-indirect (start end &optional p)
  "Restrict editing in this buffer to the current region, indirectly.

When called with a prefix, prompt for new buffer's name."
  (interactive "r")
  (deactivate-mark)
  (let* ((buffer-name (when current-prefix-arg
                        (read-string "New buffer name: ")))
         (buf (clone-indirect-buffer buffer-name nil)))
    (with-current-buffer buf
      (narrow-to-region start end))
    (switch-to-buffer buf)))

(defun narrow-or-widen-indirect-dwim (p)
  "If region is active, narrow-indirect, else kill-buffer."
  (interactive "P")
  (declare (interactive-only))
  (cond ((region-active-p)
         (narrow-to-region-indirect (region-beginning) (region-end)))
        ((buffer-narrowed-p) (kill-buffer))
        (t (message "Region not selected and not in narrowed buffer"))))

(defun join-buffers (p)
  (interactive "P")
  (let* ((buffer-names (let (names)
                         (cl-loop for buffer-name = (read-buffer "Enter buffer name (empty to finish): " nil nil)
                                  until (equal buffer-name "")
                                  do (push buffer-name names))
                         (nreverse names)))
         (combined-buffer-name (mapconcat 'identity buffer-names " + "))
         (combined-contents (with-temp-buffer
                              (dolist (buffer-name buffer-names)
                                (when (get-buffer buffer-name)
                                  (insert-buffer-substring (get-buffer buffer-name))
                                  (when p
                                    (kill-buffer buffer-name))))
                              (buffer-string))))
    ;; Create the new buffer with the combined contents
    (let ((new-buffer (get-buffer-create combined-buffer-name)))
      (with-current-buffer new-buffer
        (insert combined-contents)
        (goto-char (point-min)))
      (switch-to-buffer new-buffer))))
```

This makes it very trivial to edit specific parts of the buffer in a way that does not interfere with your view of the original buffer. So if you wanted to edit a specific point while retaining the view of the whole buffer, you can do that because the `indirect-buffer` is distinct from the original buffer. To go along with that I need an easy-to-use command `(narrow-or-widen-indirect-dwim)` which is bound to an easy key `(global-set-key (kbd "C-x n n") 'narrow-or-widen-indirect-dwim)`. In addition to that I wrote a function to join arbitrary buffers together, that way you can create several indirect buffers, edit away, and then join them all in your preferred order.

I find this most useful in combination with the package [gptel](https://github.com/karthink/gptel), whose default behavior calls on Large Language Models to insert text directly in the buffer. They only use the context of the buffer up to point, so that means an indirect buffer is the perfect case of shortening that context to what is necessary, getting the text generated, editing slightly (because of course they get it wrong the first time) and then returning to the parent buffer with the code (just killing the indirect-buffer since all of what goes in there already appears in the parent buffer).

I think it is pretty nifty and believe there is more to explore with this indirect-buffer thing. Possibly indirect-files?
