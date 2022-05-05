(require 'telega)

(setq telega-proxies
      (list
       '(:server "127.0.0.1" :port 7890 :enable t
                 :type (:@type "proxyTypeHttp"))))
