;; (defun console-log-at-point()
;;   "console.log symbol at point on new line"
;;   (interactive)
;;   (er/mark-symbol)
;;   (message selection)
;;   (end-of-line)
;;   (newline-and-indent)
;;   (insert (concat "console.log(" selection ")" ))

;;   (setq selection (thing-at-point 'symbol))
;; (setq selection (buffer-substring (mark) (point)))

;; (defun goto-interesting-symbol()
;;   (interactive)
;;   (search-forward "(")
;;   (search-forward "'")
;;   )



;; (defun jaga/narrow-to-line()
;;   (narrow-to-region (line-beginning-position) (line-end-position))
;;   )

;; (defun test()
;;   (interactive)
;;   (jaga/narrow-to-line)
;;   ;; (beginning-of-line)
;;   (if (search-forward ";")
;;       (message "trovato")
;;     (message "non trovato")
;;     )
;;   (widen)
;;   )

;; if selection active
;; (if (use-region-p)


;; (cond
;;  ((eq evil-state 'visual) (do-something))
;;  ((eq evil-state 'normal) (do-other-thing))
;;  ((eq evil-state 'insert) (do-another-thing)))


(defun console-log-at-point()
  "console.log word at point on new line"

  (interactive)
  (setq jaga/selection (thing-at-point 'word))
  (message jaga/selection)
  (end-of-line)
  (newline-and-indent)
  (insert (concat "console.log(" jaga/selection ")" ))
  )

(defun insert-filename()
  (interactive)
  (let (s)
    (setq s (file-name-sans-extension (buffer-name (current-buffer))))
    (insert s)
    ))

(defun toggle-camelcase-underscores ()
  "Toggle between camelcase and underscore notation for the symbol at point."
  (interactive)
  (save-excursion
    (let* ((bounds (bounds-of-thing-at-point 'symbol))
           (start (car bounds))
           (end (cdr bounds))
           (currently-using-underscores-p (progn (goto-char start)
                                                 (re-search-forward "_" end t))))
      (if currently-using-underscores-p
          (progn
            (upcase-initials-region start end)
            (replace-string "_" "" nil start end)
            (downcase-region start (1+ start)))
        (replace-regexp "\\([A-Z]\\)" "_\\1" nil (1+ start) end)
        (downcase-region start (cdr (bounds-of-thing-at-point 'symbol)))))))
