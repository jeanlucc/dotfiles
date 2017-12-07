(defun multi-occur-in-all-buffers (regexp &optional allbufs)
  (interactive (occur-read-primary-args))
  (multi-occur-in-matching-buffers ".*" regexp))
(global-set-key (kbd "M-s") 'multi-occur-in-all-buffers) ;;; cherche dans plusieurs buffers.

(provide 'multi-occur-conf)
