(defvar my-keywords
  '("type" "and" "case" "def" "let" "fun")
  "my keywords.")

(defvar my-keywords-regexp (regexp-opt my-keywords 'words))

(setq my-keywords nil)

(setq my-font-lock-keywords
  `(
    (,my-keywords-regexp . font-lock-function-name-face)
))

(defvar my-indent-offset 2
  "*Indentation offset for `F-Safe-mode'.")

(defun my-indent-line ()
  "Indent current line for `F-Safe-mode'."
  (interactive)
  (let ((indent-col 0))
    (save-excursion
      (beginning-of-line)
      (condition-case nil
          (while t
            (backward-up-list 1)
            (when (looking-at "[[{]")
              (setq indent-col (+ indent-col my-indent-offset))))
        (error nil)))
    (save-excursion
      (back-to-indentation)
      (when (and (looking-at "[]}]") (>= indent-col my-indent-offset))
        (setq indent-col (- indent-col my-indent-offset))))
    (indent-line-to indent-col)))

(define-derived-mode F-Safe-mode fundamental-mode
  "F-Safe-mode"
  "major mode for editing my"
  (setq font-lock-defaults '((my-font-lock-keywords)))
  (setq my-keywords-regexp nil)
  (make-local-variable 'my-indent-offset)
  (set (make-local-variable 'indent-line-function) 'my-indent-line)
  )