; Do not make backup file. (e.g. file.txt~)
(setq make-backup-files nil)

; Remove auto-saved file when quit (e.g. #file.txt#)
(setq delete-auto-save-files t)

; Do not show menu bar when launched as CUI mode.
(if window-system (menu-bar-mode 1) (menu-bar-mode 0))

; Scroll by 1 line.
(setq scroll-step 1)

; Do not show startup welcome message.
(setq inhibit-startup-message t)

; Make the final line to be a blank line.
(setq require-final-newline t)

; Show current column number.
(column-number-mode)
