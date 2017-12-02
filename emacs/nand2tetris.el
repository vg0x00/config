;; settings for nand2tetris project
(defun hook-to-mode (mode extension-list)
  (dolist (extension extension-list)
    (add-to-list 'auto-mode-alist
         (cons extension mode))))
(hook-to-mode 'c-mode (list
                       "\\.hdl$"
                       "\\.tst$"
                       "\\.cmp$"))

(defun open-nand2tris-hdl-tst-files ()
  "open .hdl and .tst files in the given project sub-diretory"
  (interactive)
  (setq names (split-string (read-string "index file-name: ")))
  (when (equal (length names) 2)
    (setq index (concat (car names) "/"))
    (setq file-name (nth 1 names))
    (setq base-dir-path "~/Downloads/nand2tetris/projects/")
    (save-excursion
      (other-window 1)      
      (find-file (concat base-dir-path index file-name ".tst"))
      (other-window 1)
      (find-file (concat base-dir-path index file-name ".hdl"))
      )))
(global-set-key (kbd "C-c o") 'open-nand2tris-hdl-tst-files)

(defun run-hardware-simulator ()
  "open hardware simulator from emacs"
  (interactive)
  (call-process "~/Downloads/nand2tetris/tools/HardwareSimulator.sh"))
(global-set-key (kbd "C-c r") 'run-hardware-simulator)

